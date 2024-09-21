{ pkgs, ... }:
{
  hardware.bluetooth = {
    settings = {
      General = {
        Experimental = true;
      };
    };
    enable = true;
  };
  hardware.bluetooth.powerOnBoot = true;
  services = {
    blueman.enable = true;
    udev.packages = [ pkgs.evtest ];
  };
  environment.systemPackages = with pkgs; [
    bluez
    bluez-alsa
    bluez-tools
  ];
}
