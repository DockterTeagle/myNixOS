{ pkgs, ... }:
{
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
  services.openssh.enable = false;
  services.fail2ban = {
    enable = true;
    maxretry = 5;
    bantime = "24h";
  };
}
