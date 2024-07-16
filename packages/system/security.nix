{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    efivar
    efibootmgr
    cryptsetup
    mkpasswd
  ];
}
    
