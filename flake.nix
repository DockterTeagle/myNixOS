{
  description = "my main flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixos-hardware.url = "github:nixos/nixos-hardware/master";
    hyprland.url = "git+https://github.com/hyprwm/hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
    };
    nixd.url = "github:nix-community/nixd";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix-rekey.url = "github:oddlama/agenix-rekey";
    agenix-shell.url = "github:aciceri/agenix-shell";
    # devour-flake = {
    #   url = "github:srid/devour-flake";
    #   flake = false;
    # };
    waybar = {
      url = "github:alexays/waybar";
    };
    solaar = {
      url = "github:svenum/solaar-flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, ... }@inputs:
    let
      systemSettings = {
        system = "x86_64-linux";
        hostName = "nixos";
        timezone = "America/Chicago";
        boot-loader = "lanzaboote";
      };
      mainUserSettings = {
        username = "cdockter";
        name = "Christopher Ryan Dockter";
        email = "chrisdockter@proton.me";
        dotfilesdir = "~/.config";
        wm = "hyprland";
        wmType = "wayland";
        browser = "firefox";
        term = "kitty";
        editor = "nvim";
        font = "JetBrains Mono Nerd Font";
        home-directory = "/home/cdockter";
        theme = "Tokyo Night";
      };
      pkgs = import nixpkgs {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowSubstitutes = true;
        };
        overlays = [
          inputs.nixpkgs-mozilla.overlay
          inputs.neovim-nightly-overlay.overlays.default
          inputs.nixpkgs-wayland.overlay
          inputs.waybar.overlays.default
          inputs.nixd.overlays.default
        ];
      };
      home-manager = inputs.home-manager;
    in
    inputs.flake-parts.lib.mkFlake
      { inherit inputs; }
      {
        imports = [
          inputs.agenix-rekey.flakeModule
          inputs.agenix-shell.flakeModules.default
          inputs.std.flakeModule
        ];
        debug = true;
        systems = [ "x86_64-linux" ];
        flake = {
          nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit pkgs inputs systemSettings home-manager mainUserSettings;
            };
            modules = [
              ./configuration.nix
              inputs.solaar.nixosModules.default
              inputs.lanzaboote.nixosModules.lanzaboote
              inputs.agenix.nixosModules.default
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
              ];
            };
          };
        };
      };
}
