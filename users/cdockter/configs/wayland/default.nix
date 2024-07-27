{ pkgs, inputs, ... }:
{
  imports = [
    ./hypr
    ./waybar.nix
    ./mako.nix
  ];
}
