#TODO: refactor me out
{ pkgs, ... }:
{
  services.solaar = {
    enable = true;
    batteryIcons = "solaar";
    window = "hide";
  };
  services = {
    hardware.openrgb.enable = true;
    scx.enable = true;
    fwupd.enable = true;
    libinput.enable = true;
    tumbler.enable = true;
    pcscd.enable = true;
    kanata.enable = true;
    # XServer and GNOME
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      excludePackages = [ pkgs.xterm ];
      videoDrivers = [
        "nvidia"
      ];
    };
  };
}
