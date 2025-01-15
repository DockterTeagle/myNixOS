{
  pkgs,
  ...
}:
{
  fonts.fontconfig.enable = true;
  #TODO: not all of these belong here
  environment.systemPackages = with pkgs; [
    sesh
    lsof
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
