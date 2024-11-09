{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    spotify
    latest.firefox-nightly-bin
    geckodriver
    discord
    swww
  ];
}
