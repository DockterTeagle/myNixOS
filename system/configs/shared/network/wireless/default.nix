{ lib, ... }:
{
  networking = {
    wireless.enable = lib.mkForce false;
    networkmanager.enable = true;
    hostName = "nixos";
    # Open ports in the firewall
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether
  };
}
