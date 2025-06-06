{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "systemctl --user enable --now hyprpolkitagent.service"
      "systemctl enable --user com.mitchell.ghostty.service"
      "systemctl --user enable --now hyprsunset.service"
      "uwsm app -- zen-twilight"
      "uwsm app -- steam"
      "uwsm app -- vesktop"
    ];
  };
}
