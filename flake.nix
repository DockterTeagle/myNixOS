{
  description = "my main flake";
  inputs = {
    # Core Nix Packages and Flakes
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixcord.url = "github:kaylorben/nixcord";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    #Boot
    ##Secure boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ##Disk allocation
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Pre-commit hooks for Git
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    # Development Tools and Utilities
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
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    stylix.url = "github:danth/stylix";
    #Terminal
    nh.url = "github:viperML/nh";
    yazi.url = "github:sxyazi/yazi";
    ghostty.url = "github:ghostty-org/ghostty";
    ## Neovim Configurations and Overlays
    # nvimconfig.url = "github:DockterTeagle/mynvimconfig";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };
  outputs =
    {
      home-manager,
      nixpkgs,
      flake-parts,
      ...
    }@inputs:
    let
      systemSettings = {
        system = "x86_64-linux";
        hostName = "nixos";
        timezone = "America/Chicago";
      };
      SystemModules = [
        ./configuration.nix
        inputs.hyprland.nixosModules.default
        inputs.solaar.nixosModules.default
        inputs.lanzaboote.nixosModules.lanzaboote
        inputs.stylix.nixosModules.stylix
        inputs.disko.nixosModules.disko
      ];
      cdockterSettings = {
        username = "cdockter";
        description = "Christopher Ryan Dockter";
        email = "steampowered.mom596@passinbox.com";
        wm = "hyprland";
        term = "ghostty";
        editor = "nvim";
        font = "JetBrains Mono Nerd Font";
        nerdfont = "jetbrains-mono";
        homeDirectory = "/home/cdockter";
        cursorPackage = "bibata-cursors";
        cursorName = "Bibata-Modern-Ice";
      };
      pkgs = import nixpkgs {
        inherit (systemSettings) system;
        config = {
          # allowUnfree = true;
          allowUnfreePredicate =
            pkg:
            (builtins.elem (nixpkgs.lib.getName pkg) [
              "nvidia-x11"
              "discord"
              "steam-unwrapped"
              "steam"
              "nvidia_driver"
              "xow_dongle-firmware"
              "obsidian"
              # "rar"
              # "unrar"
              "intel-ocl"
              "nvidia-settings"
              "fakespot-fake-reviews-amazon"
              "onetab"
            ]);
          allowSubstitutes = false;
        };
        overlays = [
          inputs.neovim-nightly-overlay.overlays.default
          inputs.nixpkgs-wayland.overlay
          inputs.nur.overlays.default
          inputs.nh.overlays.default
          inputs.hyprpanel.overlay
        ];
      };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      debug = true;
      flake = {
        nixosConfigurations = {
          isoImage = nixpkgs.lib.nixosSystem {
            inherit pkgs;
            inherit (systemSettings) system;
            modules = nixpkgs.lib.concatLists [
              SystemModules
              [
                "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
                "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
              ]
            ];
            specialArgs = {
              inherit
                inputs
                systemSettings
                home-manager
                cdockterSettings
                ;
            };
          };
          NixOS-WSL = nixpkgs.lib.nixosSystem {
            inherit pkgs;
            specialArgs = {
              inherit
                inputs
                systemSettings
                home-manager
                cdockterSettings
                ;
            };
            modules = [
              inputs.nixos-wsl.nixosModules.default
              ./configuration.nix
              inputs.stylix.nixosModules.stylix
              {
                system.stateVersion = "24.05";
                wsl.enable = true;
              }
            ];
          };
          nixos = nixpkgs.lib.nixosSystem {
            inherit pkgs;
            specialArgs = {
              inherit
                inputs
                systemSettings
                home-manager
                cdockterSettings
                ;
            };
            modules = SystemModules;
          };
        };
        homeConfigurations.cdockter = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs cdockterSettings systemSettings;
          };
          modules = [
            ./home/cdockter/home.nix
            inputs.stylix.homeManagerModules.stylix
            inputs.hyprpanel.homeManagerModules.hyprpanel
            inputs.nixcord.homeManagerModules.nixcord
          ];
        };
      };
      perSystem =
        {
          inputs',
          self',
          pkgs,
          system,
          ...
        }:
        {
          devShells.default = pkgs.mkShell {
            inherit (self'.checks.pre-commit-check) shellHook;
            packages = [
              self'.checks.pre-commit-check.enabledPackages
              inputs'.nixd.packages.nixd
              pkgs.statix
              pkgs.beautysh
              pkgs.gitlint
              pkgs.ripgrep
              pkgs.xclip
              pkgs.wslu
            ];
          };

          formatter = pkgs.nixfmt-rfc-style;
          checks = {
            pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
              src = ./.;
              hooks = {
                nixfmt-rfc-style.enable = true;
                statix.enable = true;
                flake-checker.enable = true;
                deadnix.enable = true;
              };
            };
          };
        };
    };
}
