{ lib, ... }:
{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      input = {
        General = {
          UserspaceHID = false;
          ClassicBondedOnly = false;
        };
      };
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
  };
  networking = {
    wireless.enable = lib.mkForce false;
    networkmanager.enable = true;
  };
}
