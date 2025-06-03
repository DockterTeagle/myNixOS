{
  wayland.windowManager.hyprland = {
    settings = {
      decoration = {
        rounding = 10;
        rounding_power = 10.0;
        active_opacity = 1.0;
        inactive_opacity = 0.9;
        fullscreen_opacity = 1.0;
        dim_inactive = true;
        dim_strength = 0.5;
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
          new_optimizations = true;
          noise = 3.0e-2;
          contrast = 1.0;
        };
      };
    };
  };
}
