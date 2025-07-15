{
  description = "My nixos flake";
  inputs = {
    # Core Nix Packages and Flakes
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable"; # IMPORTANT
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    # Flake-parts and modules
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:DockterTeagle/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    solaar = {
      url = "github:svenum/solaar-flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #Terminal
    nh = {
      url = "github:nix-community/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty.url = "github:ghostty-org/ghostty";
    ## Neovim Configurations and Overlays
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };

    # Wayland and GUI Tools
    ##Hyprland
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs = {
        hyprland.follows = "hyprland";
      };
    };
    Hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs = {
        hyprland.follows = "hyprland";
      };
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland"; # uses cachix so won't override
    stylix.url = "github:nix-community/stylix";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.home-manager.follows = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming.url = "github:fufexan/nix-gaming";
  };
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      { withSystem, ... }:
      {
        systems = [ "x86_64-linux" ];
        debug = true;
        imports = with inputs; [
          treefmt-nix.flakeModule
          devenv.flakeModule
          home-manager.flakeModules.default
        ];
        perSystem =
          { system, ... }:
          {
            _module.args.pkgs = import inputs.nixpkgs {
              inherit system;
              overlays = with inputs; [
                ghostty.overlays.default
                neovim-nightly-overlay.overlays.default
                nh.overlays.default
                nixpkgs-wayland.overlay
              ];
              config = {
                nvidia.acceptLicense = true;
                allowUnfree = true;
                allowSubstitutes = false;
              };
            };
            imports = [ ./flakeModules ];
          };
        flake = {
          nixosConfigurations = {
            wsl = withSystem "x86_64-linux" (
              { pkgs, inputs', ... }:
              let
                config = import ./globals { inherit inputs pkgs; };
                inherit (config) systemSettings cdockterSettings;

                # Common arguments for nixosConfigurations
              in

              inputs.nixpkgs.lib.nixosSystem {
                inherit pkgs;
                specialArgs = {
                  inherit
                    inputs
                    inputs'
                    systemSettings
                    cdockterSettings
                    ;
                };
              }
            );
            nixos = withSystem "x86_64-linux" (
              { pkgs, inputs', ... }:
              let
                config = import ./globals { inherit inputs pkgs; };
                inherit (config) systemSettings cdockterSettings;

                # Common arguments for nixosConfigurations
              in
              inputs.nixpkgs.lib.nixosSystem {
                inherit pkgs;
                specialArgs = {
                  inherit
                    inputs
                    systemSettings
                    cdockterSettings
                    inputs'
                    ;
                };
                modules = with inputs; [
                  ./system
                  chaotic.nixosModules.default
                  solaar.nixosModules.default
                  stylix.nixosModules.stylix
                  disko.nixosModules.disko
                  sops-nix.nixosModules.sops
                  nix-gaming.nixosModules.pipewireLowLatency
                  nix-gaming.nixosModules.platformOptimizations
                ];
              }
            );
          };

          homeConfigurations = {
            cdockter = withSystem "x86_64-linux" (
              { pkgs, inputs', ... }:
              let
                config' = import ./globals { inherit inputs pkgs; };
                inherit (config') systemSettings cdockterSettings;

                # Common arguments for nixosConfigurations
              in
              inputs.home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = {
                  inherit
                    pkgs
                    inputs
                    inputs'
                    systemSettings
                    cdockterSettings
                    ;
                };
                modules = with inputs; [
                  ./home/cdockter
                  zen-browser.homeModules.twilight
                  stylix.homeModules.stylix
                  sops-nix.homeManagerModules.sops
                  nix-index-database.homeModules.nix-index
                ];
              }
            );
          };

        };
      }
    );
}
