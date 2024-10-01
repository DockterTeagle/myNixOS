{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    spotify
    firefox
    discord
    # webcord
    protonvpn-gui
    sass
    swww
  ];
}
