{
  description = "My nixos flake";
  inputs = {
     hyprshell.url = "github:H3rmt/hyprshell";
     jj.url = "github:jj-vcs/jj";
  # keep-sorted start block=true newline_separated=false

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    disko.url = "github:nix-community/disko";
    fff.url = "github:dmtrKovalenko/fff.nvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    gen-luarc.url = "github:mrcjkb/nix-gen-luarc-json";
    ghostty.url = "github:ghostty-org/ghostty";
    git-hooks-nix.url = "github:cachix/git-hooks.nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland"; # uses cachix so won't override
    lux.url = "github:nvim-neorocks/lux";
    mk-shell-bin.url = "github:rrbutani/nix-mk-shell-bin";
    neorocks.url = "github:nvim-neorocks/neorocks";
    nh.url = "github:nix-community/nh";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix2container.inputs = {
      nixpkgs.follows = "nixpkgs";
    };
    nix2container.url = "github:nlewo/nix2container";
    # nix-unit.url = "github:nix-community/nix-unit";
    nixos-anywhere = {
      url = "github:nix-community/nixos-anywhere";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        disko.follows = "disko";
        treefmt-nix.follows = "treefmt-nix";
        flake-parts.follows = "flake-parts";
      };
    };
    nixos-healthchecks.url = "github:mrVanDalo/nixos-healthchecks";
    # Core Nix Packages and Flakes
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rustaceanvim = {
      url = "github:mrcjkb/rustaceanvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        neorocks.follows = "neorocks";
        gen-luarc.follows = "gen-luarc";
      };
    };
    solaar.url = "github:svenum/solaar-flake/main";
    sops-nix.url = "github:Mic92/sops-nix";
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    stylix.url = "github:nix-community/stylix";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    yazi.url = "github:sxyazi/yazi";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.home-manager.follows = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
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
          # nix-unit.modules.flake.default
          nixos-healthchecks.flakeModule
          nixos-healthchecks.nixosModules.default
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
