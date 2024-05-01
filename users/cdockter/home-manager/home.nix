
{pkgs,mainUserSettings ,...}:
let
  myPythonEnv = pkgs.mkShell{
    name = "python-opencv-tesseractShell";
     buildInputs = [
      pkgs.python312Packages.opencv4
      pkgs.python312Packages.pytesseract
      pkgs.tesseract4
      pkgs.libpng
      pkgs.freetype
      pkgs.zlib
    ];
  };
in 
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  imports = [
  # inputs.nix-colors.homeManagerModules.default ./configs/terminal/alacritty.nix
  ./configs/terminal/kitty.nix
  ./configs/terminal/tmux.nix
  ./configs/wayland/hyprland.nix
  ./configs/wayland/waybar.nix
  # ./configs/browsers/firefox.nix
  ./packages/neovim.nix
  ./packages/zsh-and-plugins.nix
  ./packages/wayland.nix
  ];
  # config = {
  #   home.systemPackages = [
  #     inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
  #   ];
  # };
  # services.pipewire.enable = true;
  # colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  home.username = mainUserSettings.username;
  # programs.firefox = {
  #   enable = true;
  #   package =(pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true;}) {});
  #   profiles.cdockter = {
  #     extensions = with firefox-addons.packages."x86_64-linux";[
  #       vimium
  #     ];
  #   };
  # };
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
      # }; TODO: figure out how to configure this part
    };
  };
  home.homeDirectory = "/home/cdockter";
  nixpkgs = {
      config = {
        packageOverrides = {
          unstable = import <nixos-unstable>{};
        };
        allowUnfree = true;
      };
  };
  nixpkgs.overlays = [
  (self: super: {
    waybar = super.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
  })
];
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # gio-trash
    # firefox-nightly
    # myPythonEnv
    htop
    # conda
    feh
    slurp# for screenshots
    wl-clipboard
    # java
    lazygit
    zathura
    nerdfonts
    nix-zsh-completions
    clang
    unzip
    polkit-kde-agent
    gnumake
    solaar #For logitech mice
    cmake
    nodejs
    discord
    neofetch
    xclip
    thunderbird
    openrocket
    spotify
    libreoffice
    nix-output-monitor
    pciutils
    gtk4
    wev
    # latest.firefox-nightly-bin
    firefox
  ];
  fonts.fontconfig.enable = true;
  programs.git= {
    enable = true;
    userName = "Dr.Teagle";
    userEmail = "chrisdockter@proton.me";
    extraConfig= {
      init.defaultBranch = "main";
    };
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  xsession = {
    enable = true;
    windowManager.command = "hyprland";
  };
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    extraPackages = with pkgs; [
      vimPlugins.vim-clang-format
    ];
    #LSPS
  };
  home.shellAliases = {
    nvchad = "NVIM_APPNAME=nvchad nvim";
    ls = "eza";
    la = "eza --long --group -h --git --all";
    ll ="eza --long --group -h --git";
    l = "eza --long --group -h --git --all";
    cd = "z";
  };
  # services.xserver.desktopManager.gnome.enable = false;
  programs.zsh= {
    enable = true;
    autosuggestion.enable = true;
    dotDir = ".config/zsh";
    initExtraFirst = ''
      source $HOME/.config/zsh/.p10k.zsh
    '';
    syntaxHighlighting.enable = true;
    # autoComplete.enable = true;
    plugins = with pkgs; [
    {
      name = "powerlevel10k";
      src = zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    {
      name = "powerlevel10k config";
      src = ./zsh;
      file = ".p10k.zsh";
    }
    # {
    #   name = "doas-zsh-plugin:";
    #   src = #TODO: get the flake to work for this   
    # }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "vi-mode" "colored-man-pages" "tmux" "colorize" "cp" "zoxide" ];
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
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
  home.sessionVariables = {
    POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    CLUTTER_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GTK_USE_PORTAL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    EDITOR = "nvim";
  };
  


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
