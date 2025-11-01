{ pkgs, ... }:
{
  hardware = {
    keyboard.qmk.enable = true;
    xone.enable = true;
  };
  programs = {
    gamescope.enable = true;
    gamemode = {
      enable = true;
      settings = {
        gpu = {
          apply_gpu_optimizations = "accept-responsibility";
          gpu_device = 0;
        };
      };
    };
    steam = {
      enable = true;
      extest.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
        # proton-cachyos_x86_64_v3
      ];
    };
  };
}
