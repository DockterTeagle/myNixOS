{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.hyprland-protocols
    pkgs.hyprcursor
    pkgs.hyprpaper
    pkgs.hyprpicker
    pkgs.hypridle
    pkgs.hyprlock
    # inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper
    # inputs.hyprpicker.packages.${pkgs.stdenv.hostPlatform.system}.hyprpicker
    # inputs.hypridle.packages.${pkgs.stdenv.hostPlatform.system}.hypridle
    # inputs.hyprlock.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock
    pkgs.wf-recorder
  ];
}
