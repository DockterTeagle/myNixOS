{
  hardware.logitech = {
    lcd.enable = true;
    wireless = {
      enableGraphical = true;
      enable = true;
    };
  };
  # systemd.services.logid = {
  #   description = "Logitech Devices Daemon (logiops)";
  #   after = [ "network.target" ]; # Adjust as needed
  #
  #   # Run logid as root
  #   serviceConfig = {
  #     ExecStart = "${pkgs.logiops}/bin/logid -c /etc/logid.cfg";
  #     Restart = "always";
  #     User = "root";
  #   };
  #
  #   wantedBy = [ "multi-user.target" ];
  #   enable = true;
  # };
  services.solaar = {
    enable = true;
    batteryIcons = "solaar";
    window = "hide";
  };
  # environment.systemPackages = [ pkgs.logiops ];
}
