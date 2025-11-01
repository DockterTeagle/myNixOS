{
  description = "My nixos flake";
  inputs = {
    /*
      CORE
      Includes NixOS-hardware, nixpkgs, home-manager, and flake-parts
      If it is system wide or used everywhere it belongs here
    */
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    /*
        System Wide
        things that help in building the system itself
    */
    stylix.url = "github:nix-community/stylix"; # I want to replace
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    ## Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    ## Applications
    nh = {
      url = "github:nix-community/nh";
    };
    ghostty.url = "github:ghostty-org/ghostty";
    neorocks.url = "github:nvim-neorocks/neorocks";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nixd.url = "github:nix-community/nixd";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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

        in
        {
          nixosConfigurations = {
            nixos = inputs.nixpkgs.lib.nixosSystem {
              inherit pkgs;
              specialArgs = { inherit inputs cdockterSettings; };
              modules = with inputs; [
                ./system
                stylix.nixosModules.stylix
                disko.nixosModules.disko # make me the flake-parts module
              ];
            };

          };
          homeConfigurations = {
            cdockter = inputs.home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              extraSpecialArgs = { inherit inputs cdockterSettings; };
              modules = with inputs; [
                ./home/cdockter
                zen-browser.homeModules.twilight
                stylix.homeModules.default
                sops-nix.homeManagerModules.sops
                nix-index-database.homeModules.nix-index
              ];
            };
          };
        };
    };
}
