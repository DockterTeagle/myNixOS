{ pkgs, ... }:
{
  # NOTE: None are modules last check date 11/22/2025
  home.packages = with pkgs; [
    axel
    rsync
    ddcutil
    imagemagick
    songrec
  ];
}
