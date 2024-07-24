{
  description = "my main flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-mozilla.url = "github:mozilla/nixpkgs-mozilla";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    # nixpkgs-wayland = {
    #   url = "github:nix-community/nixpkgs-wayland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.hyprland.follows = "hyprland";
    };
    hypridle = {
      url = "github:hyprwm/hypridle";
      inputs.hyprland.follows = "hyprland";
    };
    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.hyprland.follows = "hyprland";
    };
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.hyprland.follows = "hyprland";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixd.url = "github:nix-community/nixd";
    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix-rekey.url = "github:oddlama/agenix-rekey";
    agenix-shell.url = "github:aciceri/agenix-shell";
    std.url = "github:divnix/std";
    devour-flake = {
      url = "github:srid/devour-flake";
      flake = false;
    };
    waybar = {
      url = "github:Alexays/Waybar";
    };
    # oh-my-posh-src = {
    #   url = "github:JanDeDobbeleer/oh-my-posh";
    #   flake = false;
    # };
  };
  outputs = { nixpkgs, ... }@inputs:
    let
      systemSettings = {
        system = "x86_64-linux";
        hostName = "nixos";
        timezone = "America/Chicago";
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
        boot-loader = "lanzaboote";
      };
      pkgs = import nixpkgs {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowSubstitutes = true;
        };
        overlays = [
          # {
          #   devour-flake = self.callPackage inputs.devour-flake { };
          # }
          inputs.nixpkgs-mozilla.overlay
          inputs.neovim-nightly-overlay.overlays.default
          # inputs.nixpkgs-wayland.overlay
          # inputs.hyprland.overlays.default
          # inputs.hyprlock.overlays.default
          # inputs.hypridle.overlays.default
          # inputs.hyprpaper.overlays.default
          # inputs.hyprpicker.overlays.default
          # inputs.hyprpaper.overlays.default
          inputs.waybar.overlays.default
          # inputs.nixpkgs-wayland.overlay
          # (final: prev: {
          #   oh-my-posh = prev.oh-my-posh.overrideAttrs
          #     (oldAttrs: {
          #       version = "21.28.0";
          #       src = inputs.oh-my-posh-src;
          #     });
          # })
        ];
      };
      home-manager = inputs.home-manager;
    in
    # inputs.devour-flake.mkOutput {
      #   inputs = {
      #     inherit self;
      #     inherit nixpkgs;
      #     inherit home-manager;
      #     inherit nixpkgs-mozilla;
      #     inherit neovim-nightly-overlay;
      #     inherit hyprland;
      #     inherit hyprland-plugins;
      #     inherit hyprlock;
      #     inherit hypridle;
      #     inherit hyprpicker;
      #     inherit hyprpaper;
      #     inherit lanzaboote;
      #     inherit flake-parts;
      #     inherit nixd;
      #     inherit agenix;
      #     inherit agenix-rekey;
      #     inherit agenix-shell;
      #     inherit std;
      #     inherit devour-flake;
      #     inherit waybar;
      #   };
      #   devour = {
    inputs.flake-parts.lib.mkFlake
      { inherit inputs; }
      {
        imports = [
          # ./parts/neovim.nix
          inputs.agenix-rekey.flakeModule
          inputs.agenix-shell.flakeModules.default
          inputs.std.flakeModule
        ];
        debug = true;
        systems = [ "x86_64-linux" ];
        # perSystem = { config, ... }: { };
        flake = {
          # packages.x86_64-linux.default = pkgs.hyprlock;
          nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit pkgs inputs systemSettings home-manager mainUserSettings;
            };
            modules = [
              ./configuration.nix
              ({ pkgs, config, ... }:
                {
                  imports = [
                    # inputs.devour-flake.nixosModules.default
                  ];
                }
              )
              inputs.lanzaboote.nixosModules.lanzaboote
              inputs.agenix.nixosModules.default
            ];
          };
          homeConfigurations = {
            "cdockter" = inputs.home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              extraSpecialArgs = {
                inherit inputs mainUserSettings;
              };
              modules = [
                # inputs.hyprland.homeManagerModules.default
                # {
                #   wayland.windowManager.hyprland.enable = true;
                # }
                ./users/cdockter/home.nix
              ];
            };
          };
        };
      };
}
    

