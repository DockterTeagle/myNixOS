{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "tile,^(Firefox)$"
      "float,^(blueman-manager)$"
    ];
    windowrulev2 = [
      "idleinhibit focus, class:^steam_app_.*$"
      "idleinhibit fullscreen,class:^(firefox|chromium|chrome)$, title:^(.*YouTube.*)$"
    ];
  };
}
