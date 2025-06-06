{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "idleinhibit focus, class:^steam_app_.*$"
      "idleinhibit fullscreen,class:^(firefox|chromium|chrome)$, title:^(.*YouTube.*)$"
    ];
  };
}
