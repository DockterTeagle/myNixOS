{
  description = "My nixos flake";
  inputs = {
    /**
    Core Nix Packages and Flakes
    */
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #Boot
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
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devenv = {
      url = "github:cachix/devenv";
    };
    ##lsp
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
    yazi.url = "github:sxyazi/yazi"; #uses cache so dont override ;
    ghostty.url = "github:ghostty-org/ghostty";
    ## Neovim Configurations and Overlays
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };

    # Wayland and GUI Tools
    ##Hyprland
    hyprland.url = "github:hyprwm/Hyprland"; #uses cachix so won't override
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    stylix.url = "github:nix-community/stylix";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.home-manager.follows = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming.url = "github:fufexan/nix-gaming";
  };
  outputs = {
    nixpkgs,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = nixpkgs.lib.systems.flakeExposed;
      debug = true;
      imports = with inputs; [
        treefmt-nix.flakeModule
        devenv.flakeModule
      ];
      perSystem = {
        imports = [./flakeModules];
      };
      flake = let
        config = import ./globals {inherit inputs;};
        inherit (config) pkgs systemSettings cdockterSettings;

        # Common arguments for nixosConfigurations
        specialArgs = {inherit inputs systemSettings cdockterSettings;};
      in {
        nixosConfigurations = builtins.listToAttrs (map (name: {
          inherit name;
          value = nixpkgs.lib.nixosSystem {
            inherit pkgs;
            inherit specialArgs;
            modules = with inputs; [
              ./system
              solaar.nixosModules.default
              stylix.nixosModules.stylix
              disko.nixosModules.disko
              sops-nix.nixosModules.sops
              nix-gaming.nixosModules.pipewireLowLatency
              nix-gaming.nixosModules.platformOptimizations
              lanzaboote.nixosModules.lanzaboote
            ];
          };
        }) ["wsl" "nixos"]);

        homeConfigurations = {
          cdockter = inputs.home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs =
              specialArgs
              // {
                inherit pkgs;
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
