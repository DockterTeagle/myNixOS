{
  pkgs,
  inputs,
  ...
}:
{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    ELECTRON_ENABLE_GPU = 1;
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GL_GSYNC_ALLOWED = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    # CUDA_CACHE_PATH = "$XDG_CACHE_HOME/nv";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    MOZ_ENABLE_WAYLAND = 1;
    NVD_BACKEND = "direct";
    QT_QPA_PLATFORM = "wayland;xcb";
    LIBVA_DRIVE_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
  time.timeZone = "America/Chicago";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Programs
  programs = {
    nh = {
      enable = true;
      package = inputs.nh.packages.${pkgs.system}.default;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep=3";
      };
      flake = "/home/cdockter/Documents/myNixOS";
    };
    fish.enable = true;
  };

  # System Auto Upgrade
  system = {
    autoUpgrade.enable = false;

    # NixOS Release Version
    stateVersion = "25.05"; # Did you read the comment?
  };
  zramSwap = {
    enable = true;
    memoryPercent = 75;
  };
}
