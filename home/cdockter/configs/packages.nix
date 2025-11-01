{ pkgs, ... }:
{
  #TODO: check if any of me are modules
  home.packages = with pkgs; [
    axel
    bc
    rsync
    ddcutil
    gnome-keyring
    networkmanager
    kdePackages.plasma-nm
    kdePackages.bluedevil
    kdePackages.dolphin
    kdePackages.systemsettings
    hyprshot
    nwg-displays
    imagemagick
    songrec
    translate-shell
  ];
}
