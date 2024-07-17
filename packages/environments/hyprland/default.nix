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
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
}
