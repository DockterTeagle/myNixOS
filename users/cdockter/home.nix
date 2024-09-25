{ mainUserSettings, pkgs, ... }:
{
  imports = [
    ./configs
  ];
  gtk = {
    enable = true;
    gtk4.extraConfig = {
      gtk-decoration-layout = ":menu";

    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      size = 24;
      package = pkgs.bibata-cursors;
    };
  };
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
    homeDirectory = mainUserSettings.home-directory;
    username = mainUserSettings.username;
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
    sessionVariables =
      {
        NIXOS_OZONE_WL = "1";
        DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
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
      ".config/onedrive/sync_list" = {
        text = ''
          !/Pictures/*
          /*
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
    # let home manager install and manage itself.
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Dr.Teagle";
      userEmail = mainUserSettings.email;
      extraConfig = {
        init.defaultBranch = "main";
      };
      lfs.enable = true;
    };
  };
  xsession = {
    enable = true;
    windowManager.command = mainUserSettings.wm;
  };
}
