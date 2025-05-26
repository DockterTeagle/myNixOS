{
  cdockterSettings,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./configs
    ./secrets
  ];
  nix = {
    package = pkgs.lixPackageSets.latest.lix;
    extraOptions = ''
      !include ${config.sops.secrets."nixAccessTokens".path}
    '';
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "no-url-literals"
      ];
    };
  };
  xdg = {
    userDirs = {
      enable = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/Pictures/Screenshots";
      };
      createDirectories = true;
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
  qt = {
    enable = true;
  };
  gtk = {
    enable = true;
    gtk4.extraConfig = {
      gtk-decoration-layout = ":menu";
    };
  };

  home = {
    shell = {
      enableShellIntegration = true;
    };
    stateVersion = "25.05";
    inherit (cdockterSettings) homeDirectory;
    inherit (cdockterSettings) username;
    sessionVariables = {
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      NIXOS_OZONE_WL = "1";
      HYPRCURSOR_THEME = cdockterSettings.cursorName;
      HYPRCURSOR_SIZE = 24;
      MOZ_ENABLE_WAYLAND = 1;
      LIBSQLITE = "${pkgs.sqlite.out}/lib/libsqlite3.so";
      AW_WAYLAND_WINDOW_WATCHER_HYPRLAND = 1;
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
  xsession = {
    enable = true;
    windowManager.command = cdockterSettings.wm;
  };
}
