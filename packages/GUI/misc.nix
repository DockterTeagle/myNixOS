{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    spotify
    firefox
    discord
    protonvpn-gui
    swww
  ];
}
