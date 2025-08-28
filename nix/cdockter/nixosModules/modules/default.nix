{ inputs, cell }:
{
  imports = with inputs; [
    nixos-hardware.nixosModules.common-pc-laptop
    nixos-hardware.nixosModules.common-pc-laptop-ssd
    nixos-hardware.nixosModules.common-cpu-intel
    nixos-hardware.nixosModules.common-gpu-nvidia-sync
    solaar.nixosModules.default
    # stylix.nixosModules.stylix
    disko.nixosModules.disko
    sops-nix.nixosModules.default
    nix-gaming.nixosModules.pipewireLowLatency
    nix-gaming.nixosModules.platformOptimizations
  ];
}
