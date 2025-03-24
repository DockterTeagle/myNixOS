{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      #smart Gaps
      # "bordersize 0, floating:0, onworkspace:w[tv1]"
      # "rounding 0, floating:0, onworkspace:w[tv1]"
      # "bordersize 0, floating:0, onworkspace:f[1]"
      # "rounding 0, floating:0, onworkspace:f[1]"
      "idleinhibit focus, class:^steam_app_.*$"
      "idleinhibit fullscreen,class:^(firefox|chromium|chrome)$, title:^(.*YouTube.*)$"
    ];
  };
}
