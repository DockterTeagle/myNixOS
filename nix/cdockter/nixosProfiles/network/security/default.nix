_: {
  services.openssh.enable = false;
  services.fail2ban = {
    enable = true;
    maxretry = 5;
    bantime = "24h";
  };
}
