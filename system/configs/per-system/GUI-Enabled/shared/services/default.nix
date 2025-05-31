{pkgs, ...}: {
  services = {
    solaar = {
      enable = true;
      batteryIcons = "solaar";
      window = "hide";
    };
    hardware = {
      openrgb = {
        enable = true;
      };
    };
    dbus = {
      implementation = "broker";
      apparmor = "enabled";
    };
    fwupd.enable = true;
    gvfs.enable = true; # needed?
    libinput.enable = true;
    tumbler.enable = true;
    pcscd.enable = true;
    # XServer and GNOME
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      excludePackages = [pkgs.xterm];
      videoDrivers = [
        "nvidia"
      ];
    };
  };
}
