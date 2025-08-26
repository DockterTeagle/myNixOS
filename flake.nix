{
  description = "My nixos flake";
  inputs = {
    nixago-exts.url = "github:nix-community/nixago-extensions";
    haumea.follows = "hive/std/haumea";
    paisano = {
      url = "github:paisano-nix/core";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    colmena = {
      url = "github:zhaofengli/colmena";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    terranix.url = "github:terranix/terranix";
    devshell.url = "github:numtide/devshell";
    disko.url = "github:nix-community/disko";
    fff.url = "github:dmtrKovalenko/fff.nvim";
    gen-luarc.url = "github:mrcjkb/nix-gen-luarc-json";
    ghostty.url = "github:ghostty-org/ghostty";
    git-hooks-nix.url = "github:cachix/git-hooks.nix";
    hercules-ci-effects.url = "github:hercules-ci/hercules-ci-effects";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland"; # uses cachix so won't override
    jj.url = "github:jj-vcs/jj";
    neorocks.url = "github:nvim-neorocks/neorocks";
    nh.url = "github:nix-community/nh";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-index-database.url = "github:nix-community/nix-index-database";
    # nix-unit.url = "github:nix-community/nix-unit";
    # nixos-anywhere = {
    #   url = "github:nix-community/nixos-anywhere";
    #   inputs = {
    #     nixpkgs.follows = "nixpkgs";
    #     disko.follows = "disko";
    #     treefmt-nix.follows = "treefmt-nix";
    #     flake-parts.follows = "flake-parts";
    #   };
    # };
    # nix-gaming.url = "github:fufexan/nix-gaming";
    nixago = {
       url = "github:nix-community/nixago";
    inputs = {nixpkgs.follows = "nixpkgs";
    nixago-exts.follows = "nixago-exts";
    };
    };
    nixos-healthchecks.url = "github:mrVanDalo/nixos-healthchecks";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rustaceanvim.url = "github:mrcjkb/rustaceanvim";
    solaar.url = "github:svenum/solaar-flake/main";
    hive = {
      url = "github:divnix/hive";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        colmena.follows = "colmena";
        devshell.follows = "devshell";
        std.follows = "std";
        paisano.follows = "paisano";
        nixago.follows = "nixago";
      };
    };
    sops-nix.url = "github:Mic92/sops-nix";
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    std={url = "github:divnix/std";
      inputs = {
          nixpkgs.follows = "nixpkgs";
          devshell.follows = "devshell";
          nixago.follows = "nixago";
        };
    };
    stylix.url = "github:nix-community/stylix";
    treefmt-nix.url = "github:numtide/treefmt-nix";
        nixpkgs.follows = "nixpkgs";
        devshell.follows = "devshell";
        nixago.follows = "nixago";
        terranix.follows = "terranix";
        paisano.follows = "paisano";
      };
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    yazi.url = "github:sxyazi/yazi";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.home-manager.follows = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      { ... }:
      {
        systems = [ "x86_64-linux" ];
        debug = true;
        imports = with inputs; [
          # ./flake
          # nix-unit.modules.flake.default
          std.flakeModule
          nixos-healthchecks.flakeModule
          nixos-healthchecks.nixosModules.default
          hercules-ci-effects.flakeModule
          home-manager.flakeModules.default
        ];
        std = {
          grow = {
            cellsFrom = ./nix;
            cellBlocks = with inputs.std.blockTypes; [
              # modules implement
              (functions "homeModules")
              (functions "devshellModules")

              # profiles activate
              (functions "hardwareProfiles")
              (functions "nixosProfiles")
              (functions "homeProfiles")
              (functions "devshellProfiles")

              # configurations can be deployed
              (data "nixosConfigurations")
              (data "colmenaConfigurations")
              (data "homeConfigurations")
              (data "diskoConfigurations")
              #
              # devshells can be entered
              (devshells "devshells")

              # jobs can be run
              (runnables "jobs")
              (runnables "apps")
              (nixago "configs")
              # (inputs.std.lib.dev.treefmt "treefmt")
              # (cfg "conform")
            ];
            nixpkgsConfig = {
              overlays = [ ];
              allowUnfree = true;
            };
          };
          # winnow
          # pick = {
          #   lib = [ ];
          # };
          harvest = {
            # nixosConfigs = [
            #   "configs"
            #   "system"
            #   "nixosConfigurations"
            # ];
            devShells = [
              "repo"
              "devshells"
            ];

          };
        };
        hercules-ci.flake-update = {
          enable = true;
          when = {
            hour = [ 0 ];
            dayOfWeek = [
              "Mon"
              "Tues"
              "Wed"
              "Thu"
              "Fri"
            ];
          };
        };
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
      }
    );
    {
      hive,
      std,
      self,
      ...
    }@inputs:
    hive.growOn
      {
        inherit inputs;

        systems = [
          "aarch64-linux"
          "x86_64-linux"
        ];
        cellsFrom = ./nix;
        nixpkgsConfig = {
          allowUnfree = true;
        };

        cellBlocks =
          with std.blockTypes;
          with hive.blockTypes;
          [

            # Modules
            (functions "homeModules")

            # Profiles
            # (functions "commonProfiles")
            #nixOS
            (functions "nixosProfiles")
            (functions "nixosModules")
            (functions "nixosSuites")
            (functions "bee")
            (functions "hardwareProfiles")
            (functions "homeProfiles")
            # (functions "userProfiles")
            # (functions "users")
            # Suites
            # (functions "homeSuites")

            (devshells "devshells")
            (nixago "configs")
            (functions "lib")

            (functions "toolchain")

            # homeConfigurations
            nixosConfigurations
            diskoConfigurations

          ];
      }
      /**
        pick "gib me just what I specifiy"
        collect "gmme everything by key"
        harvest "merge"
      */
      {
        nixosConfigurations = hive.collect self "nixosConfigurations";
        diskoConfigurations = hive.collect self "diskoConfigurations";
        devShells = hive.harvest self [
          "repo"
          "devshells"
        ];

        homeModules = hive.collect self [
          "home"
        ];
      };
}
