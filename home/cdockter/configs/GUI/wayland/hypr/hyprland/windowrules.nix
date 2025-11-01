{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "noblur,class:^()$,title:^()$"
    ];
    windowrule = [
      "idleinhibit focus, class:^steam_app_.*$"
      "idleinhibit fullscreen,class:^(firefox|chromium|chrome)$, title:^(.*YouTube.*)$"
      # "workspace name:gaming, class:^steam_app_.*$"
    ];
  };
}
