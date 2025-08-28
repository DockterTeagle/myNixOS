{ pkgs, config, ... }:
{
  hardware = {
    nvidia = {
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      open = true;
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      nvidiaSettings = true;
      prime = {
        # reverseSync.enable = true;
        sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:0:1:0";
        #pci@0000:01:00.0
      };
    };
  };
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
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
