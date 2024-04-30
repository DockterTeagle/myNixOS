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
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    # firefox-addons = {
    #   url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #considering removing this as I dont really use it
  };

  outputs = { self, ... }@inputs:
    let
      systemSettings = {
        system = "x86_64-linux";
        hostname = "nixos";
      };
      mainUserSettings =  {
        username = "cdockter";
        name = "Christopher Ryan Dockter";
        email = "chrisdockter@proton.me";
        dotfilesdir = "~/.dotfiles";
        wm = "hyprland";
        wmType = "wayland";
        browser = "firefox";
        term = "kitty";
      };
      pkgs = import inputs.nixpkgs {
        system = systemSettings.system;
        overlays = [
          inputs.nixpkgs-mozilla.overlay
          inputs.neovim-nightly-overlay.overlay
        ];
      };
      # firefox-nightly = pkgs.firefoxPackages.nightly;
    in {
      # nixosConfigurations.nixos= nixpkgs.lib.nixosSystem {
      #     inherit system;
      #   modules = [
      #     solaar.nixosModules.default
      #     ../../../configuration.nix
      #   ];
      # };
      homeConfigurations = {
        "cdockter"= inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { 
            inherit mainUserSettings; 
            # firefox-addons = inputs.firefox-addons.packages;
          };
          modules = [ 
            ./home.nix
            # solaar.nixosModules.default
          ];
        };
    };
  };
}
