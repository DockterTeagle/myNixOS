{ config, ... }:
{
  environment = {
    variables = {
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      # __GL_GSYNC_ALLOWED = "1";
      # __GL_VRR_ALLOWED = "0";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      CUDA_CACHE_PATH = "$XDG_CACHE_HOME/nv";
    };
    sessionVariables = {
      NIXOS_OZONE_WL = 1;
    };
  };
  hardware = {
    nvidia = {
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      open = true;
      nvidiaPersistenced = true;
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      nvidiaSettings = true;
      prime = {
        # reverseSync.enable = true;
        allowExternalGpu = false;
        sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:0:1:0";
        #pci@0000:01:00.0
      };
    };
  };
}
