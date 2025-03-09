{
  wayland.windowManager.hyprland = {
    settings = {
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 0.6;
        fullscreen_opacity = 0.9;
        dim_inactive = true;
        dim_strength = 0.1;
        shadow = {
          enabled = true;
          range = 30;
          render_power = 3;
        };
        blur = {
          enabled = true;
          size = 12;
          passes = 4;
          ignore_opacity = true;
          xray = true;
          new_optimizations = 1;
          noise = 3.0e-2;
          contrast = 1.0;
        };
      };
    };
  };
}
