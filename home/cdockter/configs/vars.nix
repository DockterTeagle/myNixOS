{ cdockterSettings, ... }:
{

  home = {
    preferXdgDirectories = true;
    shell.enableShellIntegration = true;
    stateVersion = "25.05";
    inherit (cdockterSettings) homeDirectory;
    inherit (cdockterSettings) username;
    sessionVariables = {
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = 1;
      NVD_BACKEND = "direct";
      QT_QPA_PLATFORM = "wayland;xcb";
    };
  };
}
