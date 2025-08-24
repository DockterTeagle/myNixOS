{ pkgs, ... }:
{
  boot = {
    plymouth = {
      enable = true;
    };
    loader = {
      limine = {
        enable = true;
        biosSupport = true;
        efiSupport = true;
        biosDevice = "/dev/nvme0n1";
        secureBoot = {
          enable = true;
        };
      };
    };

    initrd.luks.reusePassphrases = false;
    kernelPackages = pkgs.linuxPackages_cachyos;
    # kernelPackages = pkgs.linuxPackages_latest;
  };
}
