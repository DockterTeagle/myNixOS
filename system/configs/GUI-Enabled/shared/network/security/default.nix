{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    protonvpn-gui
  ];
  services.fail2ban = {
    enable = true;
    maxretry = 5;
    bantime = "24h";
  };
}
