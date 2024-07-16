{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs;[
    nerdfonts
    font-awesome
  ];
  environment.systemPackages = with pkgs; [
    zsh
    eza
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
  ];
}
