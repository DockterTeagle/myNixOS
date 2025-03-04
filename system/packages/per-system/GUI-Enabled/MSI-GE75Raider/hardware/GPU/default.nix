{
  pkgs,
  config,
  ...
}: {
  environment = {
    variables = {
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      __GL_GSYNC_ALLOWED = "1";
      __GL_VRR_ALLOWED = "0"; # Controls if Adaptive Sync should be used. Recommended to set as “0” to avoid having problems on some games.
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      CUDA_CACHE_PATH = "$XDG_CACHE_HOME/nv";
    };
    sessionVariables = {
      NIXOS_OZONE_WL = 1;
    };
  };
  hardware = {
    enableAllFirmware = false;
    graphics = {
      enable = true;
      enable32Bit = true;
      package32 = pkgs.pkgsi686Linux.mesa.drivers;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        intel-media-sdk
        egl-wayland
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [libva]; #why
    };
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
        # offload.enable = true;
        allowExternalGpu = true;
        sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
