{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.linuxKernel.packages.linux_zen.msi-ec
  ];
}
