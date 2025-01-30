{ pkgs, ... }:
{
  # hardware.logitech = {
  #   lcd.enable = true;
  #   wireless = {
  #     enableGraphical = true;
  #     enable = true;
  #   };
  # };
  environment.systemPackages = with pkgs; [
    onlyoffice-bin_latest
  ];
  services.solaar = {
    enable = true;
    batteryIcons = "solaar";
    window = "hide";
  };
  # environment.systemPackages = [ pkgs.logiops ];
}
