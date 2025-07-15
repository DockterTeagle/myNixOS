{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    visidata
    vulnix
    obsidian
    speedtest
  ];
}
