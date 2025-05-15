{
  description = "My nixos flake";
  inputs = {
    # process-compose-flake.url = "github:Platonic-Systems/process-compose-flake";
    # services-flake.url = "github:juspay/services-flake";
    #what is the use of process-compose?
    # nix-health.url = "github:juspay/nix-health?dir=module";
    /**
    Core Nix Packages and Flakes
    */
    # nixos-unified = {
    #   url = "github:srid/nixos-unified";
    #   inputs={
    #     nixpkgs.follows = "nixpkgs";
    #   };
    # };
    # nixos-healthchecks.url = "github:mrVanDalo/nixos-healthchecks";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord.url = "github:KaylorBen/nixcord";
    # impermanence.url = "github:nix-community/impermanence";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #Boot
    ##Secure boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    ##Disk allocation
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Development Tools and Utilities
    devenv = {
      url = "github:cachix/devenv";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ##lsp
    nixd.url = "github:nix-community/nixd";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    solaar = {
      url = "github:svenum/solaar-flake/main";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    # Wayland and GUI Tools
    ##Hyprland
    hyprland.url = "github:hyprwm/Hyprland"; #uses cachix so won't override
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # ez-configs.url = "github:ehllie/ez-configs";
    # hypr-dynamic-cursors = {
    #   url = "github:VirtCode/hypr-dynamic-cursors";
    #   inputs.hyprland.follows = "hyprland";
    # };
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    #Terminal
    nh.url = "github:viperML/nh";
    #Used exclusively for firefox
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yazi.url = "github:sxyazi/yazi"; #uses cache so dont override ;
    ghostty.url = "github:ghostty-org/ghostty";
    ## Neovim Configurations and Overlays
    # nvimconfig.url = "github:DockterTeagle/mynvimconfig";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nix-gaming.url = "github:fufexan/nix-gaming"; #uses cachix, dont override
    nix-topology.url = "github:oddlama/nix-topology";
  };
  outputs = {
    home-manager,
    nixpkgs,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = nixpkgs.lib.systems.flakeExposed;
      debug = true;
      imports = with inputs; [
        treefmt-nix.flakeModule
        devenv.flakeModule
        # ez-configs.flakeModule
        nix-topology.flakeModule
        # nixos-healthchecks.flakeModule
        # nixos-healthchecks.nixosModules.default
        # process-compose-flake.flakeModule
        home-manager.flakeModules.home-manager
      ];
      perSystem = {
        imports = [./flakeModules];
        # process-compose."myservices" = {
        #   imports = [
        #     inputs.services-flake.processComposeModules.default
        #   ];
        # };
      };
      flake = let
        nixosSettings = {
          system = "x86_64-linux";
          hostName = "nixos";
          timezone = "America/Chicago";
          WSL = false;
        };
        nixosWSLSettings =
          nixosSettings
          // {
            hostName = "NixOS-WSL";
            WSL = true;
          };

        # Determine the profile: if the environment variable is empty, default to "nixos"
        profile = let
          p = builtins.getEnv "NIXOS_POFILE";
        in
          if p != ""
          then p
          else "nixos";
        systemSettings =
          if profile == "wsl"
          then nixosWSLSettings
          else nixosSettings;

        pkgs = import nixpkgs {
          inherit (systemSettings) system;
          config = {
            nvidia.acceptLicense = true;
            allowUnfreePredicate = pkg:
              builtins.elem (nixpkgs.lib.getName pkg) [
                "nvidia-x11"
                "nvidia-persistenced"
                "nvidia-settings"
                "discord"
                "steam-unwrapped"
                "steam"
                "nvidia_driver"
                "xow_dongle-firmware"
                "obsidian"
                "spotify"
                "intel-ocl"
                "fakespot-fake-reviews-amazon"
                "onetab"
              ];
            allowSubstitutes = false;
          };
          overlays = with inputs; [
            ghostty.overlays.default
            neovim-nightly-overlay.overlays.default
            # nix.overlays.default
            nh.overlays.default
            hyprpanel.overlay
            yazi.overlays.default
          ];
        };

        cdockterSettings = {
          username = "cdockter";
          description = "Christopher Ryan Dockter";
          email = "65212972+DockterTeagle@users.noreply.github.com";
          wm = "hyprland";
          term = "ghostty";
          editor = "nvim";
          font = "JetBrainsMono NF";
          nerdfont = pkgs.nerd-fonts.jetbrains-mono;
          homeDirectory = "/home/cdockter";
          cursorPackage = pkgs.bibata-cursors;
          cursorName = "Bibata-Modern-Ice";
          cursorSize = 24;
        };

        # Common arguments for nixosConfigurations
        specialArgs = {inherit inputs systemSettings cdockterSettings;};
      in {
        nixosConfigurations = builtins.listToAttrs (map (name: {
          inherit name;
          value = nixpkgs.lib.nixosSystem {
            inherit pkgs;
            inherit specialArgs;
            modules = with inputs; [
              ./system
              chaotic.nixosModules.default
              solaar.nixosModules.default
              lanzaboote.nixosModules.lanzaboote
              stylix.nixosModules.stylix
              disko.nixosModules.disko
              sops-nix.nixosModules.sops
              nix-gaming.nixosModules.pipewireLowLatency
              nix-gaming.nixosModules.platformOptimizations
              nixos-wsl.nixosModules.default
              nix-topology.nixosModules.default
            ];
          };
        }) ["wsl" "nixos"]);

        homeConfigurations = {
          cdockter = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = specialArgs;
            modules = with inputs; [
              ./home/cdockter
              zen-browser.homeModules.twilight
              stylix.homeManagerModules.stylix
              hyprpanel.homeManagerModules.hyprpanel
              sops-nix.homeManagerModules.sops
              nixcord.homeModules.nixcord
            ];
          };
        };
      };
    };
}
