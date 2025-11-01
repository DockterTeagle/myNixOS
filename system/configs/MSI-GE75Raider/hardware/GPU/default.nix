{ config, ... }:
{
  hardware = {
    nvidia = {
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      open = true;
      powerManagement = {
        enable = true;
        # finegrained = true;
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
}
