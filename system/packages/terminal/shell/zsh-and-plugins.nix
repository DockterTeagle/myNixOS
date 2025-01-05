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
    gitFull
    ventoy # for writing ISO images
    # vim-full
    feh
    man-db
  ];
}
