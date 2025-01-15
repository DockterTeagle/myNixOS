{
  systemSettings,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    wirelesstools
    traceroute
    inetutils
  ];
  networking = {
    wireless.enable = lib.mkForce false;
    networkmanager.enable = true;
    inherit (systemSettings) hostName;
    # Open ports in the firewall
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether
  };
}
