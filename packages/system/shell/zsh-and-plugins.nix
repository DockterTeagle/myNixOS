{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs;[
    nerdfonts
    font-awesome
  ];
  #TODO: not all of these belong here
  environment.systemPackages = with pkgs; [
    lsof
    zsh
    oh-my-zsh
    zsh-syntax-highlighting
    nix-zsh-completions
    libgcc
    unzip
    cmake
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
    fastfetch
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
