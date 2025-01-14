{
  pkgs,
  ...
}:
{
  imports = [ ./antivirus ];
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.hyprlock = { };
    # antivirus.enable = true;
  };
  systemd = {
    # user.services.polkit-gnome-authentication-agent-1 = {
    #   description = "polkit-gnome-authentication-agent-1";
    #   wantedBy = [ "graphical-session.target" ];
    #   wants = [ "graphical-session.target" ];
    #   after = [ "graphical-session.target" ];
    #   serviceConfig = {
    #     Type = "simple";
    #     ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    #     Restart = "on-failure";
    #     RestartSec = 1;
    #     TimeoutStopSec = 10;
    #   };
    # };
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
