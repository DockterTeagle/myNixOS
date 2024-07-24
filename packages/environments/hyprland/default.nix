{ pkgs, inputs, ... }:
{
  environment.systemPackages = [
    pkgs.xdg-desktop-portal-hyprland
    pkgs.hyprland-protocols
    inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper
    inputs.hyprpicker.packages.${pkgs.stdenv.hostPlatform.system}.hyprpicker
    inputs.hypridle.packages.${pkgs.stdenv.hostPlatform.system}.hypridle
    inputs.hyprlock.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock
    pkgs.wf-recorder
  ];
}
