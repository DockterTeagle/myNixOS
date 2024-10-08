{ pkgs, ... }:
{
  hardware.bluetooth = {
    powerOnBoot = true;
    input = {
      General = {
        UserspaceHID = false;
        ClassicBondedOnly = false;
      };
    };
    settings = {
      General = {
        Experimental = true;
      };
    };
    enable = true;
  };
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
