{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    # package = pkgs.tofi;rofi
    package = pkgs.rofi-wayland;

    terminal = "${pkgs.kitty}/bin/kitty";
    location = "center";
  };
}
