{ systemSettings, conf, pkgs, lib, ... }:
# let
#   inherit (conf) mainUserSettings systemSettings;
#   inherit (lib) optional;
# in
{
  # imports =
  #   [
  #     (import ./ssh/default.nix { inherit mainUserSettings lib systemSettings; })
  #   ]
  #   ++ optional (conf.wireless) (import ./wireless/default.nix { inherit pkgs systemSettings; });
  networking = {
    networkmanager.enable = true;
    hostName = systemSettings.hostName;
    # Open ports in the firewall
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether
    # networking.firewall.enable = false;
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  };
}
