{ inputs, cell }:
inputs.hive.findLoad {
  inherit inputs cell;
  block = ./.;
}
# modules = with inputs; [
#   stylix.nixosModules.default
#   chaotic.nixosModules.default
#   solaar.nixosModules.default
#   disko.nixosModules.disko
#   sops-nix.nixosModules.sops
#   nix-gaming.nixosModules.pipewireLowLatency
#   nix-gaming.nixosModules.platformOptimizations
# ];
