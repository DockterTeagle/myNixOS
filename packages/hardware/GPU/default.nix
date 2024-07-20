{ pkgs, config, ... }:
{
  imports = [
    # ./gpu-config.nix
  ];
  hardware = {
    enableAllFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        intel-media-sdk
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
    };
    nvidia = {
      modesetting.enable = true;
      open = false;
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      forceFullCompositionPipeline = true;
      prime = {
        sync.enable = true;
        intelBusId = "PCI:0:2:0"; #FIXME: these IDS are device dependant
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
