{
  cdockterSettings,
  config,
  ...
}: {
  #TODO: move this whole file into configs
  imports = [
    ./configs
    ./secrets
  ];
  xdg = {
    userDirs = {
      enable = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/Pictures/Screenshots";
      };
      createDirectories = false;
      pictures = "${config.home.homeDirectory}/Pictures";
    };
    portal = {
      xdgOpenUsePortal = true;
      config = {
        preferred = {
          default = "hyprland;gtk";
          org.freedestop.impl.portal.FileChooser = "kde";
        };
      };
    };
  };
  qt.enable = true;

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

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    home-manager.enable = true;
  };
}
