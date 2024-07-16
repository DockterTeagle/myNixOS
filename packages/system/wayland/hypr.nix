{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    xdg-desktop-portal-hyprland
    hyprland-protocols
    hyprpaper
    hyprpicker
    hypridle
    hyprlock
    wf-recorder
  ];
}
