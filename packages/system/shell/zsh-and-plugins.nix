{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    # nerdfonts
    font-awesome
  ];
  #TODO: not all of these belong here
  environment.systemPackages = with pkgs; [
    sesh
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
    ventoy # for writing ISO images
    # vim-full
    gnumake
    feh
    man-db
    # wget
    # curl
    zip
    btop
    lsd
  ];
}
