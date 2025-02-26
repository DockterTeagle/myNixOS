{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.nix-gaming.packages.${pkgs.system}.viper
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge
    inputs.nix-gaming.packages.${pkgs.system}.northstar-proton
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
    xpadneo.enable = true;
    xone.enable = true;
  };
  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
    java.enable = true;
    steam = {
      enable = true;
      package = pkgs.steam.override {
        extraEnv = {
          MANGOHUD = true;
          RADV_TEX_ANSIO = true;
        };
        extraLibraries = p: with p; [atk];
      };
      platformOptimizations.enable = true;
      protontricks.enable = true;
      extest.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraPackages = with pkgs; [
        gamescope
      ];
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
