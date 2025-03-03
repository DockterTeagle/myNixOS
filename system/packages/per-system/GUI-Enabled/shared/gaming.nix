{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    winetricks
    jstest-gtk
    samba
    SDL2
    sdl-jstest
    umu-launcher
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.gamescope
      ];
    })
  ];
  services = {
    hardware = {
      openrgb = {
        enable = true;
      };
    };
  };
  hardware = {
    keyboard.qmk = {
      enable = true;
    };
    steam-hardware.enable = true;
    xpadneo.enable = true;
    xone.enable = true;
  };
  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
    java.enable = true;
    steam = {
      enable = true;
      platformOptimizations.enable = true;
      protontricks.enable = true;
      extest.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
