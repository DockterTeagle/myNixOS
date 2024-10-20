{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    spotify
    firefox
    geckodriver
    discord
    vencord
    protonvpn-gui
    swww
    vesktop
  ];
}
