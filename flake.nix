{
  description = "My nixos flake";
  inputs = {
    nixos-hardware.url = "github:nixos/nixos-hardware";
    jj.url = "github:jj-vcs/jj";
    devshell.url = "github:numtide/devshell";
    disko.url = "github:nix-community/disko";
    gen-luarc.url = "github:mrcjkb/nix-gen-luarc-json";
    ghostty.url = "github:ghostty-org/ghostty";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neorocks.url = "github:nvim-neorocks/neorocks";
    nh.url = "github:nix-community/nh";
    nix-gaming.url = "github:fufexan/nix-gaming";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    # nixos-anywhere = {
    #   url = "github:nix-community/nixos-anywhere";
    #   inputs = {
    #     nixpkgs.follows = "nixpkgs";
    #     disko.follows = "disko";
    #     treefmt-nix.follows = "treefmt-nix";
    #     flake-parts.follows = "flake-parts";
    #   };
    # };
    nixago = {
      url = "github:nix-community/nixago";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rustaceanvim.url = "github:mrcjkb/rustaceanvim";
    solaar.url = "github:svenum/solaar-flake/main";
    hive = {
      url = "github:divnix/hive";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        devshell.follows = "devshell";
        std.follows = "std";
        nixago.follows = "nixago";
      };
    };
    sops-nix.url = "github:Mic92/sops-nix";
    hyprland.url = "github:hyprwm/Hyprland"; # uses cachix so won't override
    hyprshell.url = "github:H3rmt/hyprshell";
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    std = {
      url = "github:divnix/std";
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

        cellsFrom = ./nix;
        cellBlocks =
          with (inputs.nixpkgs.lib.mergeAttrsList [
            std.blockTypes
            hive.blockTypes
          ]); [
            (functions "bee")
            (functions "common")

            # modules
            (functions "nixosModules")

            # profiles
            (functions "hardwareProfiles")
            (functions "nixosProfiles")
            (functions "userProfiles")
            (functions "homeProfiles")

            # suites
            (functions "nixosSuites")
            (functions "homeSuites")

            # configurations
            nixosConfigurations
            diskoConfigurations
            homeConfigurations

            # devshells
            (functions "nvimPlugins")
            (functions "toolchain")
            (functions "treefmtConfigs")
            (nixago "configs")
            (functions "flakeModules")
            (devshells "devshells")

            # nixpkgs
            (functions "nixpkgsConfig")
            (functions "overlays")
            (pkgs "pkgs")
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
        homeConfigurations = hive.collect self "homeConfigurations";
      };
}
