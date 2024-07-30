{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    gamescope
    winetricks
    protontricks
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
