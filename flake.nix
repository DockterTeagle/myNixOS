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
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
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
    nur.url = "github:nix-community/NUR";
    # firefox-addons = {
    zen-browser.url = "github:0xc000022070/zen-browser-flake"; # url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
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
        WSL = false;
      };
      SystemModules = with inputs; [
        ./configuration.nix
        hyprland.nixosModules.default
        solaar.nixosModules.default
        lanzaboote.nixosModules.lanzaboote
        stylix.nixosModules.stylix
        disko.nixosModules.disko
      ];
      pkgs = import nixpkgs {
        inherit (systemSettings) system;
        config = {
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
              "spotify"
              # "rar"
              # "unrar"
              "intel-ocl"
              "nvidia-settings"
              "fakespot-fake-reviews-amazon"
              "onetab"
            ]);
          allowSubstitutes = false;
        };
        overlays = with inputs; [
          neovim-nightly-overlay.overlays.default
          nixpkgs-wayland.overlay
          nur.overlays.default
          nh.overlays.default
          hyprpanel.overlay
          yazi.overlays.default
        ];
      };
      cdockterSettings = {
        username = "cdockter";
        description = "Christopher Ryan Dockter";
        email = "steampowered.mom596@passinbox.com";
        wm = "hyprland";
        term = "ghostty";
        editor = "nvim";
        font = "JetBrainsMono NF";
        nerdfont = "jetbrains-mono";
        homeDirectory = "/home/cdockter";
        cursorPackage = pkgs.bibata-cursors;
        cursorName = "Bibata-Modern-Ice";
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
                cdockterSettings
                ;
            };
            modules = SystemModules;
          };
        };
        homeConfigurations = {
          cdockter = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
              inherit inputs cdockterSettings systemSettings;
            };
            modules = with inputs; [
              ./home/cdockter/home.nix
              stylix.homeManagerModules.stylix
              hyprpanel.homeManagerModules.hyprpanel
              nixcord.homeManagerModules.nixcord
            ];
          };
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
            packages = with pkgs; [
              self'.checks.pre-commit-check.enabledPackages
              statix
              inputs'.nixd.packages.nixd
              #formatters
              beautysh
              yq
              gitlint
              marksman
              ltex-ls-plus
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
