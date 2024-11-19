{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # spotify
    # latest.firefox-nightly-bin
    firefox
    geckodriver
    discord
    swww
  ];
}
