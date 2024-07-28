{ pkgs, mainUserSettings, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty}/bin/kitty";
    font = mainUserSettings.font;
    location = "center";
  };
}
