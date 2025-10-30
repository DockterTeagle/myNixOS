{
  wayland.windowManager.hyprland.settings = {
    animations = {
      workspace_wraparound = true;
    };
    bezier = [
      "linear,0,0,1,1"
      "md3_standard,0.2,0,0,1"
      "md3_decel,0.05,0.7,0.1,1"
      "md3_accel, 0.3, 0, 0.8, 0.15"
      "overshot, 0.05, 0.9, 0.1, 1.1"
      "crazyshot, 0.1, 1.5, 0.76, 0.92"
      "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
      "fluent_decel, 0.1, 1, 0, 1"
      "easeInOutCirc, 0.85, 0, 0.15, 1"
      "easeOutCirc, 0, 0.55, 0.45, 1"
      "easeOutExpo, 0.16, 1, 0.3, 1"
      "easeOutQuint,0.23,1,0.32,1"
      "easeInOutCubic,0.65,0.05,0.36,1"
      "almostLinear,0.5,0.5,0.75,1.0"
      "quick,0.15,0,0.1,1"
    ];
    animation = [
      "global, 1, 10, default"
      "windows, 1, 3, md3_decel, popin 60%"
      "border, 1, 10, easeOutQuint"
      "fade, 1, 2.5, md3_decel"
      "workspaces, 1, 3.5, easeOutExpo, slide"
      "specialWorkspace, 1, 3, md3_decel, slidevert"
    ];
  };
}
