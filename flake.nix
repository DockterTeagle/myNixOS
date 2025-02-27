{
  description = "my main flake";
  inputs = {
    # Core Nix Packages and Flakes
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix.url = "github:numtide/treefmt-nix";
    alejandra = {
      url = "github:kamadorueda/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #Boot
    ##Secure boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ##Disk allocation
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Development Tools and Utilities
    ## Pre-commit hooks for Git
    git-hooks-nix.url = "github:cachix/git-hooks.nix";
    devenv.url = "github:cachix/devenv";
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

    # Wayland and GUI Tools
    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ##Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
    };
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    nixcord.url = "github:kaylorben/nixcord";
    stylix.url = "github:danth/stylix";
    #Terminal
    nh.url = "github:viperML/nh";
    #Used exclusively for firefox
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    yazi.url = "github:sxyazi/yazi";
    ghostty.url = "github:ghostty-org/ghostty";
    ## Neovim Configurations and Overlays
    # nvimconfig.url = "github:DockterTeagle/mynvimconfig";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nix-gaming.url = "github:fufexan/nix-gaming";
  };
  outputs = {
    home-manager,
    nixpkgs,
    flake-parts,
    self,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = nixpkgs.lib.systems.flakeExposed;
      debug = true;
      imports = with inputs; [
        git-hooks-nix.flakeModule
        treefmt-nix.flakeModule
        devenv.flakeModule
      ];
      perSystem = {
        inputs',
        pkgs,
        config,
        ...
      }: {
        treefmt = import ./treefmt.nix {inherit inputs' self pkgs;};
        devenv = import ./devenv.nix {
          inherit self inputs' pkgs;
          inherit (config) treefmt;
        };
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
            neovim-nightly-overlay.overlays.default
            nixpkgs-wayland.overlay
            nh.overlays.default
            hyprpanel.overlay
            yazi.overlays.default
            alejandra.overlay
          ];
        };

        SystemModules = with inputs; [
          ./configuration.nix
          hyprland.nixosModules.default
          solaar.nixosModules.default
          lanzaboote.nixosModules.lanzaboote
          stylix.nixosModules.stylix
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          nix-gaming.nixosModules.pipewireLowLatency
          nix-gaming.nixosModules.platformOptimizations
          nixos-wsl.nixosModules.default
        ];

        cdockterSettings = {
          username = "cdockter";
          description = "Christopher Ryan Dockter";
          email = "65212972+DockterTeagle@users.noreply.github.com";
          wm = "hyprland";
          term = "ghostty";
          editor = "nvim";
          font = "JetBrainsMono NF";
          nerdfont = "jetbrains-mono";
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
            modules = SystemModules;
          };
        }) ["wsl" "nixos"]);

        homeConfigurations = {
          cdockter = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = specialArgs;
            modules = with inputs; [
              ./home/cdockter/home.nix
              stylix.homeManagerModules.stylix
              hyprpanel.homeManagerModules.hyprpanel
              nixcord.homeManagerModules.nixcord
              sops-nix.homeManagerModules.sops
            ];
          };
        };
      };
    };
}
