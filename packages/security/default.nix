{ pkgs, ... }:
{
  security.rtkit.enable = true;
  environment.systemPackages = with pkgs;[
    efivar
    efibootmgr
    cryptsetup
    mkpasswd
  ];
}
    
