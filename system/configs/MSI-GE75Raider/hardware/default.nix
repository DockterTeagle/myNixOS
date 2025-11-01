{ inputs, ... }:
{

  imports = [
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
    inputs.nixos-hardware.nixosModules.common-pc-laptop-hdd
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia-sync
    ./audio
    ./bluetooth
    ./power
    ./GPU
    ./MSI-GE75Raider-hardware-configuration.nix
    ./disko.nix
  ];
}
