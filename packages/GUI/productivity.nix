{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    solaar #for logitech mice
    libreoffice
    thunderbird
  ];
}
