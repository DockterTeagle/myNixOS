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
    package = pkgs.lix;
    extraOptions = ''
      !include ${config.sops.secrets."nixAccessTokens".path}
    '';
  };
  xdg = {
    userDirs = {
      enable = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${cdockterSettings.homeDirectory}/Pictures/Screenshots";
      };
      createDirectories = true;
      pictures = "${cdockterSettings.homeDirectory}/Pictures";
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
  #TODO: make a home-manager-rollback service on user login

  # systemd.user = {
  #   enable = true;
  #   services.home-manager-rollback = {
  #     Unit = {
  #       Description = "roll back feature for home-manager";
  #       Before = "graphical-session.target";
  #       After = "graphical-session-pre.target";
  #       Wants = "graphical-session-pre.target";
  #
  #     };
  #     Service = {
  #       Type = "oneshot";
  #       ExecStart = "/home/cdockter/.nix-profile/bin/home-manager-rollback";
  #       StandardInput = "tty-force";
  #       StandardOutput = "journal";
  #       StandardError = "journal";
  #       Environment = "PATH=%h/.nix-profile/bin:/usr/local/bin:/usr/bin:/bin"; };
  #     Install = {
  #       WantedBy = [ "default.target" ];
  #     };
  #   };
  # };
  home = {
    # this value determines the home manager release that your configuration is
    # compatible with. this helps avoid breakage when a new home manager release
    # introduces backwards incompatible changes.
    #
    # you should not change this value, even if you update home manager. if you do
    # want to update the value, then make sure to first check the home manager
    # release notes.
    stateVersion = "23.11";
    # home manager needs a bit of information about you and the paths it should
    # manage.
    inherit (cdockterSettings) homeDirectory;
    inherit (cdockterSettings) username;
    sessionVariables = {
      # home manager can also manage your environment variables through 'home.sessionvariables'. if you don't want to manage your shell through home
      # manager then you have to manually source 'hm-session-vars.sh' located at
      # either
      #
      #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      #
      # or
      #
      #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
      #
      # or
      #
      #  /etc/profiles/per-user/cdockter/etc/profile.d/hm-session-vars.sh
      #
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
    # the home.packages option allows you to install nix packages into your
    # environment.
    # home manager is pretty good at managing dotfiles. the primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the nix store. activating the configuration will then make '~/.screenrc' a
      # # symlink to the nix store copy.
      # ".screenrc".source = dotfiles/screenrc;
      # ".config/onedrive/sync_list" = {
      #   text = ''
      #     !/Pictures/*
      #     /*
      #   '';
      # };
      ".config/onedrive/config" = {
        text = ''
          skip_dir = "Pictures"
        '';
      };
      # # you can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
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
