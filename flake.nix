{
  description = "my main flake";

  inputs = {
    nvimconfig.url = "github:DockterTeagle/mynvimconfig";
    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nh.url = "github:viperML/nh";
    nur.url = "github:nix-community/NUR";
    ranger-zoxide = {
      url = "github:jchook/ranger-zoxide";
      flake = false;
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nil.url = "github:oxalica/nil";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };
    agenix-rekey.url = "github:oddlama/agenix-rekey";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nix-matlab = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "gitlab:doronbehar/nix-matlab";
    };
    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # consider getting rid of this and replacing with the packages individual flakes
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
    };
    ags.url = "github:Aylur/ags";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixd.url = "github:nix-community/nixd";
    # devour-flake = {
    #   url = "github:srid/devour-flake";
    #   flake = false;
    # };
    solaar = {
      url = "github:svenum/solaar-flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {nixpkgs, ...} @ inputs: let
    systemSettings = {
      system = "x86_64-linux";
      hostName = "nixos";
      timezone = "America/Chicago";
      boot-loader = "lanzaboote";
    };
    mainUserSettings = {
      username = "cdockter";
      name = "Christopher Ryan Dockter";
      email = "steampowered.mom596@passinbox.com";
      dotfilesdir = "~/.config";
      wm = "hyprland";
      wmType = "wayland";
      browser = "firefox";
      term = "kitty";
      editor = "nvim";
      font = "JetBrains Mono Nerd Font";
      nerdfont = "JetBrainsMono";
      homeDirectory = "/home/cdockter";
      theme = "Tokyo Night";
    };
    pkgs = import nixpkgs {
      system = systemSettings.system;
      config = {
        allowUnfree = true;
        allowSubstitutes = true;
      };
      overlays = [
        inputs.neovim-nightly-overlay.overlays.default
        # inputs.nvimconfig.overlays.${systemSettings.system}.default
        inputs.nixpkgs-wayland.overlay
        inputs.nixd.overlays.default
        inputs.nur.overlay
        inputs.nh.overlays.default
      ];
    };
    home-manager = home-manager;
  in
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.agenix-rekey.flakeModule
      ];
      debug = true;
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      flake = {
        formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              pkgs
              inputs
              systemSettings
              home-manager
              mainUserSettings
              ;
          };
          modules = [
            ./configuration.nix
            inputs.solaar.nixosModules.default
            inputs.lanzaboote.nixosModules.lanzaboote
            inputs.agenix.nixosModules.default
            inputs.stylix.nixosModules.stylix
            {
              environment.systemPackages = [inputs.alejandra.defaultPackage.${systemSettings.system}];
            }
          ];
        };
        homeConfigurations = {
          "cdockter" = inputs.home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
              inherit inputs mainUserSettings systemSettings;
            };
            modules = [
              ./users/cdockter/home.nix
              inputs.stylix.homeManagerModules.stylix
            ];
          };
        };
      };
    };
}
