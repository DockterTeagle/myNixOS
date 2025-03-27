{pkgs, ...}: {
  imports = [./antivirus];
  services = {
    printing.enable = false;
  };
  security = {
    doas = {
      enable = true;
    };
    sudo = {
      execWheelOnly = true;
    };
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.hyprlock = {};
  };
  environment.systemPackages = with pkgs; [
    efivar
    efibootmgr
    cryptsetup
    mkpasswd
    pv
    openssl
    sbsigntool
    openresolv
  ];
}
