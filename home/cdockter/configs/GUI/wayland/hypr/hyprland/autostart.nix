{
  wayland.windowManager.hyprland.settings.exec-once = [
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
    "systemctl enable --user com.mitchell.ghostty.service"
    "uwsm app -- zen-twilight"
    "uwsm app -- ghostty"
  ];
}
