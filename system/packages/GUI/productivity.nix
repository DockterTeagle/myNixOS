# { pkgs, ... }:
{
  # hardware.logitech = {
  #   lcd.enable = true;
  #   wireless = {
  #     enableGraphical = true;
  #     enable = true;
  #   };
  # };
  services.solaar = {
    enable = true;
    batteryIcons = "solaar";
    window = "hide";
  };
  # environment.systemPackages = [ pkgs.logiops ];
}
