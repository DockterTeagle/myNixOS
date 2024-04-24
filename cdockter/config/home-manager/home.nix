
{pkgs,config, ...}:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  imports = [
#  <catppuccin/modules/home-manager>
  ];
#  catppuccin.flavour = "mocha";
  home.username = "cdockter";
  home.homeDirectory = "/home/cdockter";
  nixpkgs = {
      config = {
        packageOverrides = {
          unstable = import <nixos-unstable>{};
        };
        allowUnfree = true;
      };
      overlays = [
        (import (builtins.fetchTarball {
          url ="https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
        }))
      ];
  };
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
    zsh
    conda
    lazygit
    alacritty
    zathura
    xdotool
    pstree
    firefox
    nerdfonts
    oh-my-zsh
    zsh-completions
    zsh-syntax-highlighting
    zsh-powerlevel10k
    clang
    unzip
    gnumake
    cmake
    nodejs
    ripgrep
    eza
    discord
    neofetch
    xclip
    thunderbird
    #LSPS For Neovim
    lua-language-server
    nil
    rocmPackages.llvm.clang-tools-extra # also includes clang-tidy
    nodePackages_latest.pyright
    texlab
    vim-language-server
    marksman
    cmake-language-server
    nodePackages_latest.bash-language-server
    deno
    # julials
    #Formatters
    stylua
    alejandra
    selene
    bibtex-tidy
    nixpkgs-fmt
    python312Packages.black
    cmake-format
    #Linters
    cpplint
    python312Packages.mypy
    ruff
    vale
    #DAPS
    python312Packages.debugpy
    rocmPackages_5.llvm.lldb
  ];
  programs.git= {
    enable = true;
    userName = "Dr.Teagle";
    userEmail = "chrisdockter@proton.me";
    extraConfig= {
      init.defaultBranch = "main";
    };
  };
  programs.alacritty.enable = true;
  #programs.alacritty.catppuccin.enable = true;
  programs.alacritty.settings = {
    scrolling.history = 1000;
    font = {
      size = 15.0;
      normal = {
        family = "JetBrains Mono Nerd Font";
        style = "Regular";
      };
      bold = {
        family = "JetBrains Mono Nerd Font";
        style = "Bold";
      };
      italic = {
        family = "JetBrains Mono Nerd Font";
        style = "Italic";
      };
    };
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
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
    la = "eza--long --group --all";
    ll ="eza --long --group -h --git";
    nvchadmypy="~/.local/share/nvchad/mason/packages/mypy/venv/bin/mypy";
    nvchadpip="~/.local/share/nvchad/mason/packages/mypy/venv/bin/pip";
    cd = "z";
  };

  programs.zsh= {
    enable = true;
    dotDir = ".config/zsh";
    # initExtraFirst = ''
    #   if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    #     source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    #   fi
    # '';
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
      src = ~/.config/zsh;
      file = ".p10k.zsh";
    }
      # {
      #   name = "zsh-syntax-highlighting";
      #   src = fetchFromGitHub {
      #     owner = "zsh-users";
      #     repo = "zsh-syntax-highlighting";
      #     rev = "0.8.0";
      #   };
      #   
      # }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo" "vi-mode" "colored-man-pages"];
    };
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
    EDITOR = "nvchad";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
