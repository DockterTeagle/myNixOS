{
  description = "homeManager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    # nizpkgs-mozilla.url = "github:mozilla/nixpkgs-mozilla";
   # solaar = {
   #   url = "github:Svenum/Solaar-Flake/latest";
   # };
   #neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

  };

  outputs = { nixpkgs, home-manager, ... }@inputs:#nixpkgs-mozilla
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # overlay = import nixpkgs-mozilla{};
      # pkgsMozilla = import nixpkgs {overlays = [overlay];};
     # overlays = [
  #      inputs.neovim-nightly-overlay.overlay
#];
    in {
      # nixosConfigurations.nixos= nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #   modules = [
      #     solaar.nixosModules.default
      #     ../../../configuration.nix
      #   ];
      # };
      homeConfigurations."cdockter" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = { inherit inputs; };

        modules = [ 
          ./home.nix
          # solaar.nixosModules.default
          # {home.packages = [pkgsMozilla.firefox-nightly];}
        ];

      };
    };

}
