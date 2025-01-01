{ pkgs, inputs, ... }:
{
  fonts.fontconfig.enable = true;
  #TODO: not all of these belong here
  environment.systemPackages = with pkgs; [
    inputs.ghostty.packages.x86_64-linux.default
    sesh
    lsof
    zsh
    unzip
    zip
    lazygit
    zathura
    slurp # for screenshots
    gitFull
    ventoy # for writing ISO images
    # vim-full
    feh
    man-db
    btop
  ];
}
