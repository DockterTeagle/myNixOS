{
  description = "My nixos flake";
  inputs = {
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
            (functions "homeSuites")

            (devshells "devshells")
            (nixago "configs")
            (functions "lib")
            (functions "toolchain")
            (functions "nixpkgsConfig")

            homeConfigurations
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
        homeConfigurations = hive.collect self "homeConfigurations";
      };
    }
