{ pkgs, ... }:
{
  # imports = [ ./antivirus ];
  services = {
    printing.enable = false;
  };
  security = {
    sudo = {
      execWheelOnly = true;
    };
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.hyprlock = { };
  };
  environment.systemPackages = with pkgs; [
    efivar
    cryptsetup
    mkpasswd
    pv
    openssl
    sbsigntool
    openresolv
  ];
}
