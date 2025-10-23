{ pkgs, config, ... }:
{
  boot = {
    # kernelModules = [ "msi-ec" ];
    extraModulePackages = [ config.boot.kernelPackages.msi-ec ];
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
