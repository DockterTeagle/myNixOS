{
  description = "my main flake";
  inputs = {
    # Core Nix Packages and Flakes
    # nixos-unified = {
    #   url = "github:srid/nixos-unified";
    #   inputs={
    #     nixpkgs.follows = "nixpkgs";
    #   };
    # };
    # nixos-healthchecks.url = "github:mrVanDalo/nixos-healthchecks";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #Boot
    ##Secure boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    ##Disk allocation
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Development Tools and Utilities
    devenv.url = "github:cachix/devenv";
    ##lsp
    nixd.url = "github:nix-community/nixd";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    solaar = {
      url = "github:svenum/solaar-flake/main";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    # Wayland and GUI Tools
    # nixpkgs-wayland = {
    #   url = "github:nix-community/nixpkgs-wayland";
    #   inputs = {
    #     nixpkgs.follows = "nixpkgs";
    #   };
    # };
    ##Hyprland
    hyprland.url = "github:hyprwm/Hyprland"; #uses cachix so won't override
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprlock.url = "github:hyprwm/hyprlock";
    # hy3 = {
    #   url = "github:outfoxxed/hy3";
    #   inputs.hyprland.follows = "hyprland";
    # };
    # ez-configs.url = "github:ehllie/ez-configs";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    #Terminal
    nh.url = "github:viperML/nh";
    #Used exclusively for firefox
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yazi.url = "github:sxyazi/yazi"; #uses cache so dont override ;
    ghostty.url = "github:ghostty-org/ghostty";
    ## Neovim Configurations and Overlays
    # nvimconfig.url = "github:DockterTeagle/mynvimconfig";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nix-gaming.url = "github:fufexan/nix-gaming"; #uses cachix, dont override
    nix-topology.url = "github:oddlama/nix-topology";
  };
  outputs = {
    home-manager,
    nixpkgs,
    flake-parts,
    self,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = nixpkgs.lib.systems.flakeExposed;
      debug = true;
      imports = with inputs; [
        treefmt-nix.flakeModule
        devenv.flakeModule
        # ez-configs.flakeModule
        nix-topology.flakeModule
        # nixos-healthchecks.flakeModule
      ];
      perSystem = {
        inputs',
        pkgs,
        config,
        self',
        ...
      }: {
        treefmt = import ./flakeModules/treefmt.nix {inherit inputs' self' pkgs;};
        topology.modules = [
          ./flakeModules/topology.nix
          {inherit (self) nixosConfigurations;}
        ];
        devenv = import ./flakeModules/devenv.nix {
          inherit self' inputs' pkgs;
          inherit (config) treefmt;
        };
      };
      flake = import ./flakeModules/systemFlake.nix {inherit inputs nixpkgs home-manager;}; # this is probably stupid
    };
}
