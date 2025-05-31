{
  description = "My nixos flake";
  inputs = {
    /**
    Core Nix Packages and Flakes
    */
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    #Boot
    ##Disk allocation
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Development Tools and Utilities
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devenv = {
      url = "github:cachix/devenv";
    };
    ##lsp
    nixd.url = "github:nix-community/nixd";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    solaar = {
      url = "github:svenum/solaar-flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #Terminal
    nh.url = "github:nix-community/nh";
    yazi.url = "github:sxyazi/yazi"; #uses cache so dont override ;
    ghostty.url = "github:ghostty-org/ghostty";
    ## Neovim Configurations and Overlays
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    # Wayland and GUI Tools
    ##Hyprland
    hyprland.url = "github:hyprwm/Hyprland"; #uses cachix so won't override
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    stylix.url = "github:nix-community/stylix";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.home-manager.follows = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming.url = "github:fufexan/nix-gaming"; #uses cachix, dont override
  };
  outputs = {
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
      ];
      perSystem = {
        imports = [./flakeModules];
      };
      flake = let
        nixosSettings = {
          system = "x86_64-linux";
          hostName = "nixos";
          time.timeZone = "America/Chicago";
          WSL = false;
          i18n = {
            defaultLocale = "en_US.UTF-8";
            extraLocaleSettings = {
              LC_ADDRESS = "en_US.UTF-8";
              LC_IDENTIFICATION = "en_US.UTF-8";
              LC_MEASUREMENT = "en_US.UTF-8";
              LC_MONETARY = "en_US.UTF-8";
              LC_NAME = "en_US.UTF-8";
              LC_NUMERIC = "en_US.UTF-8";
              LC_PAPER = "en_US.UTF-8";
              LC_TELEPHONE = "en_US.UTF-8";
              LC_TIME = "en_US.UTF-8";
            };
          };
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
          theme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
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
              stylix.nixosModules.stylix
              disko.nixosModules.disko
              sops-nix.nixosModules.sops
              nix-gaming.nixosModules.pipewireLowLatency
              nix-gaming.nixosModules.platformOptimizations
              nixos-wsl.nixosModules.default
            ];
          };
        }) ["wsl" "nixos"]);

        homeConfigurations = {
          cdockter = inputs.home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs =
              specialArgs
              // {
                inherit pkgs;
              };
            modules = with inputs; [
              ./home/cdockter
              zen-browser.homeModules.twilight
              stylix.homeModules.stylix
              hyprpanel.homeManagerModules.hyprpanel
              sops-nix.homeManagerModules.sops
              nixcord.homeModules.nixcord
              nix-index-database.hmModules.nix-index
            ];
          };
        };
      };
    };
}
