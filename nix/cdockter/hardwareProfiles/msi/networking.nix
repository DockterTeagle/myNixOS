{ lib, ... }:
{

  useDHCP = lib.mkDefault true;
  interfaces.enp0s20f0u4u5.useDHCP = true;
  interfaces.enp3s0.useDHCP = true;
  interfaces.wlo1.useDHCP = true;
}
