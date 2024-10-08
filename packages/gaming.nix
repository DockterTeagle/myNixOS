{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs;[
    jstest-gtk
    samba
    SDL2
    sdl-jstest
    roccat-tools
  ];
  services.flatpak.enable = true;
  services.udev = {
    extraRules = ''
      SUBSYSTEM=="input", ATTRS{idVendor}=="045e", ATTRS{idProduct}=="0b00", MODE="0666"
    '';
    enable = true;
  };
  programs.steam = {
    gamescopeSession.enable = true;
    protontricks.enable = true;
    extest.enable = true;
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
