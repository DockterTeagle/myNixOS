
{ config, pkgs,lib, ... }:
  {
    packages = with pkgs;[
    polkit_gnome
    libva-utils
    fuseiso
    udiskie
    gnome.adwaita-icon-theme
    gnome.gnome-themes-extra
    nvidia-vaapi-driver
    gsettings-desktop-schemas
    swaynotificationcenter
    wlr-randr
    ydotool
    wl-clipboard
    hyprland-protocols
    swayidle
    swaylock
    xdg-desktop-portal-hyprland
    wofi
    swww
    grim
    xdg-utils
    lshw
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    adwaita-qt
    adwaita-qt6
    ];
  }
