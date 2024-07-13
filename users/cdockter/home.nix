{ pkgs, mainUserSettings, ... }:
# let
#   myPythonEnv = pkgs.mkShell{
#     name = "python-opencv-tesseractShell";
#      buildInputs = [
#       pkgs.python312Packages.opencv4
#       pkgs.python312Packages.pytesseract
#       pkgs.tesseract4
#       pkgs.libpng
#       pkgs.freetype
#       pkgs.zlib
#     ];
#   };
# in 
{
  imports = [
    ./configs/terminal/kitty.nix
    ./configs/terminal/tmux.nix
    ./configs/wayland/hyprland.nix
    ./configs/wayland/waybar.nix
    # ./configs/browsers/firefox.nix
    ./packages/neovim.nix
    ./packages/zsh-and-plugins.nix
    ./packages/wayland.nix
    ./packages/languages/lua.nix
    ./packages/languages/compilers.nix
    ./packages/wayland/hypr.nix
  ];
  xdg = {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-wlr
        pkgs.xdg-desktop-portal-gtk
      ];
      # config = {
      #   common = {
      #     default = ["gtk"];
      #   };
      # }; todo: figure out how to configure this part
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
    homeDirectory = "/home/cdockter/";
    username = mainUserSettings.username;
    shellAliases = {
      nvchad = "NVIM_APPNAME=nvchad nvim";
      ls = "eza";
      la = "eza --long --group -h --git --all";
      ll = "eza --long --group -h --git";
      l = "eza --long --group -h --git --all";
      cd = "z";
    };
    # home manager can also manage your environment variables through
    # 'home.sessionvariables'. if you don't want to manage your shell through home
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
    sessionVariables = {
      polkit_auth_agent = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      gsettings_schema_dir = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
      libva_driver_name = "nvidia";
      xdg_session_type = "wayland";
      gbm_backend = "nvidia-drm";
      __glx_vendor_library_name = "nvidia";
      wlr_no_hardware_cursors = "1";
      nixos_ozone_wl = "1";
      moz_enable_wayland = "1";
      sdl_videodriver = "wayland";
      _java_awt_wm_nonreparenting = "1";
      clutter_backend = "wayland";
      wlr_renderer = "vulkan";
      xdg_current_desktop = "hyprland";
      xdg_session_desktop = "hyprland";
      gtk_use_portal = "1";
      nixos_xdg_open_use_portal = "1";
      editor = "nvim";
      xdg_config_home = "/home/cdockter/.config/";
    };
    # the home.packages option allows you to install nix packages into your
    # environment.
    packages = with pkgs; [
      # gio-trash
      # mypythonenv
      brightnessctl
      zulu17
      wine
      ventoy
      protonvpn-gui
      python312
      python312Packages.debugpy
      python312Packages.setuptools
      zip
      yad
      htop
      lldb_18
      feh
      slurp # for screenshots
      wl-clipboard
      lazygit
      zathura
      nerdfonts
      nix-zsh-completions
      libgcc
      unzip
      polkit-kde-agent
      gnumake
      solaar #for logitech mice
      cmake
      nodejs
      discord
      fastfetch
      xclip
      thunderbird
      spotify
      libreoffice
      nix-output-monitor
      pciutils
      gtk4
      wev
      # latest.firefox-nightly-bin
      firefox
    ];
    # home manager is pretty good at managing dotfiles. the primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the nix store. activating the configuration will then make '~/.screenrc' a
      # # symlink to the nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # you can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };
  };

  fonts.fontconfig.enable = true;
  programs = {
    # let home manager install and manage itself.
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Dr.Teagle";
      userEmail = "chrisdockter@proton.me";
      extraConfig = {
        init.defaultBranch = "main";
      };
      lfs.enable = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    neovim = {
      enable = true;
      package = pkgs.neovim;
    };
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      dotDir = ".config/zsh";
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "vi-mode" "colored-man-pages" "tmux" "colorize" "cp" "zoxide" ];
      };
    };
    oh-my-posh = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      useTheme = "atomic";
    };
  };
  xsession = {
    enable = true;
    windowManager.command = "hyprland";
  };
}
