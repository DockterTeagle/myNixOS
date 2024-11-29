{ pkgs, ... }:
{
  programs.ags = {
    enable = true;
    configDir = ./ags;
    extraPackages = with pkgs; [
      gtksourceview5
      webkitgtk
      accountsservice
    ];
  };
}
