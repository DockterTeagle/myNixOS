{
  description = "homeManager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-mozilla.url = "github:mozilla/nixpkgs-mozilla";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs-wayland= {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nixpkgs-wayland";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    # firefox-addons = {
    #   url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #considering removing this as I dont really use it
  };

  outputs = { self,nixos-hardware, ... }@inputs:
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
        dotfilesdir = "~/.dotfiles";
        wm = "hyprland";
        wmType = "wayland";
        browser = "firefox";
        term = "kitty";
        editor = "nvim";
        font = "JetBrains Mono Nerd Font";
        home-manager = inputs.home-manager;
      };
      pkgs = import inputs.nixpkgs {
        system = systemSettings.system;
        overlays = [
          inputs.nixpkgs-mozilla.overlay
          inputs.neovim-nightly-overlay.overlay
          inputs.nixpkgs-wayland.overlay
        ];
        config = {
          allowUnfree = true;
        };
      };
      home-manager = inputs.home-manager;
      # firefox-nightly = pkgs.firefoxPackages.nightly;
    in {
      nixosConfigurations.nixos= inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit pkgs;
          inherit systemSettings;
          inherit home-manager;
        };
        modules = [
          # solaar.nixosModules.default
          ./configuration.nix
          inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p1
        ];
      };
      homeConfigurations = {
        "cdockter"= inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { 
           inherit mainUserSettings;
            # firefox-addons = inputs.firefox-addons.packages;
          };
          modules = [ 
            ./users/cdockter/home-manager/home.nix
            # solaar.nixosModules.default
          ];
        };
    };
  };
}
