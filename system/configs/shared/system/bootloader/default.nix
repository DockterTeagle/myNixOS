{ pkgs, ... }:
{
  boot = {
    plymouth = {
      enable = true;
    };
    loader = {
      limine = {
        enable = true;
        efiSupport = true;
        secureBoot = {
          enable = true;
        };
      };
    };
    initrd.luks.reusePassphrases = false;
    kernelPackages = pkgs.linuxPackages_cachyos;
  };
}
