{
  description = "My nixos flake";
  inputs = {
    # Core Nix Packages and Flakes
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    jj.url = "github:jj-vcs/jj";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-index-database.url = "github:nix-community/nix-index-database";
    # Flake-parts and modules
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #Disk allocation
    disko.url = "github:nix-community/disko";
    # Development Tools and Utilities
    sops-nix.url = "github:Mic92/sops-nix";
    solaar.url = "github:svenum/solaar-flake/main";
    #Terminal
    nh.url = "github:nix-community/nh";
    ghostty.url = "github:ghostty-org/ghostty";
    yazi.url = "github:sxyazi/yazi";
    ## Neovim Configurations and Overlays
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    gen-luarc.url = "github:mrcjkb/nix-gen-luarc-json";
    neorocks.url = "github:nvim-neorocks/neorocks";
    rustaceanvim = {
      url = "github:mrcjkb/rustaceanvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        neorocks.follows = "neorocks";
        gen-luarc.follows = "gen-luarc";
      };
    };
    # Wayland and GUI Tools
    ##Hyprland
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
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
          ./flake
          flake-parts.flakeModules.partitions
          home-manager.flakeModules.default
        ];
        perSystem =
          { system, ... }:
          {
            _module.args.pkgs = import inputs.nixpkgs {
              inherit system;
              overlays = with inputs; [
                neorocks.overlays.default
                gen-luarc.overlays.default
                ghostty.overlays.default
                neovim-nightly-overlay.overlays.default
                yazi.overlays.default
                nh.overlays.default
              ];
              config = {
                nvidia.acceptLicense = true;
                allowUnfree = true;
                allowSubstitutes = false;
              };
            };
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
