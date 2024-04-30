{
  description = "homeManager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nix-colors.url = "github:misterio77/nix-colors";
    nixpkgs-mozilla.url = "github:mozilla/nixpkgs-mozilla";
   # solaar = {
   #   url = "github:Svenum/Solaar-Flake/latest";
   # };
   neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

  };

  outputs = { self, nixpkgs, ... }@inputs:#nixpkgs-mozilla
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          # inputs.neovim-nightly-overlay.overlay
          inputs.nixpkgs-mozilla.overlay
          inputs.neovim-nightly-overlay.overlay
        ];
      };
    in {
      # nixosConfigurations.nixos= nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #   modules = [
      #     solaar.nixosModules.default
      #     ../../../configuration.nix
      #   ];
      # };
      homeConfigurations."cdockter" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        # extraSpecialArgs = { inherit inputs; };
        modules = [ 
          ./home.nix
          # solaar.nixosModules.default
          # {home.packages = [pkgsMozilla.firefox-nightly];}
        ];
        # config.home.packages = with pkgs;[
        #   firefox-nightly
        # ];
      };
    };

}
