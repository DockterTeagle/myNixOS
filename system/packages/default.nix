{ pkgs, ... }:
{
  #NOTE: NONE OF ME ARE MODULES --check date 08/22/25
  environment.systemPackages = with pkgs; [
    visidata
    vulnix
  ];
}
