{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  environment.systemPackages = with pkgs; [
    sesh
    unzip
    zip
    lazygit
    zathura
    ventoy-full # for writing ISO images
    # vim-full
    feh
    man-db
  ];
}
