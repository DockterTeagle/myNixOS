#TODO: refactor me out
{pkgs, ...}: {
  imports = [./solaar.nix];
  services = {
    fwupd.enable = true;
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
