{ config, pkgs, lib, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    # plugins = with inputs.hyprland-plugins.packages.${pkgs.system}; [
    #   # hyprbars
    #   hyprexpo
    #   borders-plus-plus
    #   hyprtrails
    #   hyprwinwrap
    # ];
  };
  home.packages = with pkgs;[
    xdg-desktop-portal-hyprland
    hyprland-protocols
    hyprpaper
    hyprpicker
    hypridle
    hyprlock
  ];
}
