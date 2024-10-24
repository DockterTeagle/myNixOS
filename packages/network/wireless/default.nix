{
  systemSettings,
  pkgs,
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
    networkmanager.enable = true;
    hostName = systemSettings.hostName;
    # Open ports in the firewall
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether
    # networking.firewall.enable = false;
    # wireless.enable = true; # Enables wireless support via wpa_supplicant.
  };
}
