{ pkgs, ... }:

{
  environment.systemPackages = with pkgs;[
    polkit_gnome
    libva-utils
    fuseiso
    udiskie
    nvidia-vaapi-driver
    gsettings-desktop-schemas
    swaynotificationcenter
    wlr-randr
    ydotool
    wl-clipboard
    wofi
    swww
    grim
    xdg-utils
    lshw
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    adwaita-qt
    adwaita-qt6
    waybar
    wayland-protocols
    wayland-utils
    pavucontrol
    wlroots
    upower
    gtkmm3
    dbus
    mako #notification manager
    rofi-wayland
  ];
}