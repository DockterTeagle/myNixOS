{ lib, ... }:
{
  services = {
    illum.enable = true;
    tuned.enable = true;
    upower.enable = true;
    tlp.enable = lib.mkForce false;
    thermald.enable = true;
  };
}
