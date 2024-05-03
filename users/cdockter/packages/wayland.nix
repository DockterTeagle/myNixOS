
{ config, pkgs,lib, ... }:
  {
    home.packages= with pkgs;[
      polkit_gnome
      # firefox-wayland
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
      waybar
      wayland-protocols
      wayland-utils
      wlroots
      upower
      gtkmm3
      waybar
      xdg-desktop-portal
      dbus
      power-profiles-daemon
      hyprpaper
    ];
  }
