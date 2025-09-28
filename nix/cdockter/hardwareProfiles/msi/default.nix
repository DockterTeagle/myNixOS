{
  inputs,
  modulesPath,
  cell,
}:
{
  imports = [
    cell.hardwareProfiles.base
    cell.nixosModules.modules
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
    inputs.nixos-hardware.nixosModules.common-pc-laptop-hdd
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia-sync
    # inputs.nixos-hardware.nixosModules.common-gpu-nvidia
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
}
