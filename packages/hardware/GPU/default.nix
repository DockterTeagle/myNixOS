{
  pkgs,
  config,
  ...
}: {
  environment = {
    variables = {
      LIBVA_DRIVER_NAME = "nvidia";
      XDG_SESSION_TYPE = "wayland";
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
      WLR_NO_HARDWARE_CURSORS = 1;
    };
  };
  imports = [
    # ./gpu-config.nix
  ];
  hardware = {
    enableAllFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        intel-media-sdk
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [libva];
    };
    nvidia = {
      modesetting.enable = true;
      open = false;
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      forceFullCompositionPipeline = true;
      # nvidia-drm.modeset = 1;
      prime = {
        sync.enable = true;
        intelBusId = "PCI:0:2:0"; #FIXME: these IDS are device dependant
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
