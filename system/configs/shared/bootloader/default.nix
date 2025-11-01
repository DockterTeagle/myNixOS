{ pkgs, ... }:
{
  zramSwap = {
    enable = true;
    memoryPercent = 75;
  };
  boot = {
    plymouth = {
      enable = true;
    };
    loader = {
      limine = {
        maxGenerations = 50;
        enable = true;
        efiSupport = true;
        secureBoot = {
          enable = true;
        };
      };
    };
    initrd.luks.reusePassphrases = false;
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
