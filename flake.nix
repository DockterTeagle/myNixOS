{
  description = "My nixos flake";
  inputs = {
    hyprshell.url = "github:H3rmt/hyprshell";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    disko.url = "github:nix-community/disko";
    flake-parts.url = "github:hercules-ci/flake-parts";
    ghostty.url = "github:ghostty-org/ghostty";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland"; # uses cachix so won't override
    neorocks.url = "github:nvim-neorocks/neorocks";
    flint.url = "github:NotAShelf/flint";
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
    # Core Nix Packages and Flakes
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    sops-nix.url = "github:Mic92/sops-nix";
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    stylix.url = "github:nix-community/stylix";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.home-manager.follows = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      debug = true;
      imports = with inputs; [
        ./flake
        home-manager.flakeModules.default
        disko.flakeModules.default
        # nix-unit.modules.flake.default
        # nixos-healthchecks.flakeModule
        # nixos-healthchecks.nixosModules.default
      ];
      flake =
        let
          pkgs = import inputs.nixpkgs {
            system = "x86_64-linux";
            config = {
              nvidia.acceptLicense = true;
              allowUnfree = true;
              allowSubstitutes = false;
            };
            overlays = with inputs; [ neorocks.overlays.default ];
          };
          config = import ./globals { inherit inputs pkgs; };
          inherit (config) cdockterSettings;

          # Common arguments for nixosConfigurations
        in
        {
          # diskoConfigurations = {
          #   msi = import ./msi-disko.nix;
          # };
          nixosConfigurations = {
            nixos = inputs.nixpkgs.lib.nixosSystem {
              inherit pkgs;
              specialArgs = {
                inherit
                  inputs
                  cdockterSettings
                  ;
              };
              modules = with inputs; [
                ./system
                chaotic.nixosModules.default
                stylix.nixosModules.stylix
                disko.nixosModules.disko
                sops-nix.nixosModules.sops
                nix-gaming.nixosModules.pipewireLowLatency
                nix-gaming.nixosModules.platformOptimizations
                nixos-hardware.nixosModules.common-pc-laptop
                nixos-hardware.nixosModules.common-pc-laptop-ssd
                nixos-hardware.nixosModules.common-pc-laptop-hdd
                nixos-hardware.nixosModules.common-cpu-intel
                nixos-hardware.nixosModules.common-gpu-nvidia-sync
              ];
            };

          };
          homeConfigurations = {
            cdockter = inputs.home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              extraSpecialArgs = {
                inherit
                  # pkgs
                  inputs

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
            };
          };
        };
    };
}
