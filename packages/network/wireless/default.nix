{ systemSettings, pkgs, ... }:
{
  networking = {
    wireless.iwd.enable = true;
    hostName = systemSettings.hostName;

  };
  environment.systemPackages = with pkgs; [
    wirelesstools
    traceroute
    inetutils
  ];
}
