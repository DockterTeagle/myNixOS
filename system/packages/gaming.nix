{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jstest-gtk
    samba
    SDL2
    sdl-jstest
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.gamescope
      ];
    })
  ];
  services.udev = {
    extraRules = ''
      SUBSYSTEM=="input", ATTRS{idVendor}=="045e", ATTRS{idProduct}=="0b00", MODE="0666"
    '';
    enable = true;
  };
  hardware = {
    steam-hardware.enable = true;
    xone.enable = true;
    graphics = {
      # extraPackages32 = with pkgs; [
      #   extest
      #   attr
      #   libGLU
      #   libGL
      #   intel-media-driver
      #   intel-ocl
      #   intel-vaapi-driver
      #
      # ];
      # extraPackages = with pkgs; [
      #   libGL
      #   libGLU
      #   intel-media-driver
      #   intel-ocl
      #   intel-vaapi-driver
      #   extest
      #   attr
      # ];
    };
  };
  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
    java.enable = true;
    steam = {
      # package = pkgs.steam.override {
      #   withPrimus = true;
      #   extraPkgs = pks: [
      #     bumblebee
      #     glxinfo
      #   ];
      # };
      protontricks.enable = true;
      extest.enable = true;
      gamescopeSession.enable = true;
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
