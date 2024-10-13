{ pkgs, ... }:
{
  hardware.logitech = {
    lcd.enable = true;
    wireless = {
      enableGraphical = true;
      enable = true;
    };
  };
  services = {
    solaar = {
      enable = true;
    };
  };
  environment = {
    systemPackages = with pkgs;[
      zoom-us
      logiops
    ];
  };
}
