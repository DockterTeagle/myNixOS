{
  description = "Main Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    solaar = {
     url = "github:Svenum/Solaar-Flake/latest";
    };
   #neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

  };

  outputs = { nixpkgs, home-manager,solaar, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
     # overlays = [
  #      inputs.neovim-nightly-overlay.overlay
#];
    in {
      nixosConfigurations = {
        nixos= nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            solaar.nixosModules.default
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.cdockter= {
                imports = [ ./cdockter/config/home-manager/home.nix ];
              };
            }
          ];
        };
      };
      homeConfigurations."cdockter" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = { inherit inputs; };

        # modules = [ 
        #   ./cdockter/config/home-manager/home.nix
        # ];

      };
    };

}
