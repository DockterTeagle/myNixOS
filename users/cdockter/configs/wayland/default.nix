{ pkgs, inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./waybar.nix
  ];
}