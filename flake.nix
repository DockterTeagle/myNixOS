{
  description = "my main flake";
  inputs = {
    # Core Nix Packages and Flakes
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";

    # Pre-commit hooks for Git
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";

    # Development Tools and Utilities
    yazi.url = "github:sxyazi/yazi";
    # nixfmt.url = "github:nixos/nixfmt";
    # alejandra = {
    #   url = "github:kamadorueda/alejandra/3.0.0";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nh.url = "github:viperML/nh";
    nixd.url = "github:nix-community/nixd";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    solaar = {
      url = "github:svenum/solaar-flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mozilla.url = "github:mozilla/nixpkgs-mozilla";
    # Neovim Configurations and Overlays
    # nvimconfig.url = "github:DockterTeagle/mynvimconfig";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    # Wayland and GUI Tools
    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
    };
    stylix.url = "github:danth/stylix";
    ags.url = "github:Aylur/ags";
    # Additional Utilities
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Optional inputs (commented out)
    # devour-flake = {
    #   url = "github:srid/devour-flake";
    #   flake = false;
    # };
  };
  outputs =
    {
      nixpkgs,
      flake-parts,
      ags,
      ...
    }@inputs:
    #TODO: make the pkgs use flake-parts so that this is system agnostic
    let
      systemSettings = {
        system = "x86_64-linux";
        hostName = "nixos";
        timezone = "America/Chicago";
        boot-loader = "lanzaboote";
      };
      cdockterSettings = {
        username = "cdockter";
        name = "Christopher Ryan Dockter";
        email = "steampowered.mom596@passinbox.com";
        wm = "hyprland";
        term = "kitty";
        editor = "nvim";
        font = "JetBrains Mono Nerd Font";
        nerdfont = "JetBrainsMono";
        homeDirectory = "/home/cdockter";
        theme = "Tokyo Night";
      };
      pkgs = import nixpkgs {
        inherit (systemSettings) system;
        config = {
          allowUnfree = true;
          allowSubstitutes = true;
        };
        overlays = [
          inputs.neovim-nightly-overlay.overlays.default
          inputs.nixpkgs-wayland.overlay
          inputs.nixd.overlays.default
          inputs.nur.overlays.default
          inputs.nh.overlays.default
          inputs.mozilla.overlay
        ];
      };
      inherit (inputs) home-manager;
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      debug = true;
      flake = {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              pkgs
              inputs
              systemSettings
              home-manager
              cdockterSettings
              ;
          };
          modules = [
            ./configuration.nix
            inputs.hyprland.nixosModules.default
            inputs.solaar.nixosModules.default
            inputs.lanzaboote.nixosModules.lanzaboote
            inputs.stylix.nixosModules.stylix
          ];
        };
        homeConfigurations.cdockter = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs cdockterSettings systemSettings;
          };
          modules = [
            ./users/cdockter/home.nix
            inputs.stylix.homeManagerModules.stylix
            inputs.hyprland.homeManagerModules.default
            inputs.ags.homeManagerModules.default
          ];
        };
      };
      perSystem =
        {
          # config,
          self',
          # inputs',
          pkgs,
          system,
          ...
        }:
        {
          devShells.default = pkgs.mkShell {
            inherit (self'.checks.pre-commit-check) shellHook;
            packages = [
              (ags.packages.${system}.default.override {
                extraPackages = with ags.packages.${system}; [
                  # cherry pick packages
                  apps
                  auth
                  battery
                  bluetooth
                  # cava
                  greet
                  hyprland
                  mpris
                  network
                  notifd
                  powerprofiles
                  tray
                  wireplumber
                ];
              })
              self'.checks.pre-commit-check.enabledPackages
            ];
          };

          formatter = pkgs.nixfmt-rfc-style;
          checks = {
            pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
              src = ./.;
              hooks = {
                # nix
                nixfmt-rfc-style.enable = true;
                statix.enable = true;
                flake-checker.enable = true;
                deadnix.enable = true;
                #javascript
                denofmt.enable = true;
                denolint.enable = true;
              };
            };
          };
        };
    };
}
