{pkgs, ...}: {
  # hardware.system76.enableAll = true;
  environment.systemPackages = [
    pkgs.linuxKernel.packages.linux_zen.msi-ec
  ];
}
