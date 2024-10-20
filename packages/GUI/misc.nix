{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    spotify
    firefox
    geckodriver
    discord
    protonvpn-gui
    swww
    vesktop
  ];
}
