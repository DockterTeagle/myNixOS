{ cdockterSettings, ... }:
{

  home = {
    file.".config/uwsm/env-hyprland".text = ''
      export AQ_DRM_DEVICES="/dev/dri/card1:/dev/dri/card2"
    '';
    preferXdgDirectories = true;
    shell.enableShellIntegration = true;
    stateVersion = "25.05";
    inherit (cdockterSettings) homeDirectory;
    inherit (cdockterSettings) username;
    sessionVariables = {
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GL_GSYNC_ALLOWED = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      # CUDA_CACHE_PATH = "$XDG_CACHE_HOME/nv";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      NIXOS_OZONE_WL = 1;
      MOZ_ENABLE_WAYLAND = 1;
      NVD_BACKEND = "direct";
      QT_QPA_PLATFORM = "wayland;xcb";
      LIBVA_DRIVE_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };
  };
}
