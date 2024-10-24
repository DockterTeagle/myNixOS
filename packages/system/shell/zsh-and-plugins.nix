{pkgs, ...}: {
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    nerdfonts
    font-awesome
  ];
  #TODO: not all of these belong here
  environment.systemPackages = with pkgs; [
    lsof
    zsh
    zsh-syntax-highlighting
    nix-zsh-completions
    unzip
    nodejs
    fzf
    thefuck
    lazygit
    zathura
    slurp # for screenshots
    wl-clipboard
    texlive.combined.scheme-full
    gitFull
    tmux
    kitty
    wine
    ventoy # for writing ISO images
    vim-full
    gnumake
    feh
    man-db
    wget
    curl
    zip
    btop
    lsd
  ];
}
