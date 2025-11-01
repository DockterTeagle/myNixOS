{ pkgs, ... }:
{
  #TODO: check if any of me are modules
  home.packages = with pkgs; [
    axel
    rsync
    ddcutil
    kdePackages.plasma-nm
    kdePackages.bluedevil
    kdePackages.dolphin
    kdePackages.systemsettings
    nwg-displays
    imagemagick
    songrec
  ];
}
