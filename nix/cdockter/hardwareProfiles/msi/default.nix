{ inputs, cell }:
let
  inherit (inputs) nixos-hardware;
in
{
  imports = with nixos-hardware.nixosModules; [
    common-pc-laptop
    common-pc-laptop-ssd
    common-cpu-intel
    common-gpu-nvidia
    common-gpu-nvidia-sync
    inputs.disko.nixosModules.disko
  ];
}
