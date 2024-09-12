{ pkgs, ... }:
{
  # environment.systemPackages = with pkgs;[
  #   gamescope # what am I for??
  #   winetricks
  # ];
  programs.steam = {
    protontricks.enable = true;
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
