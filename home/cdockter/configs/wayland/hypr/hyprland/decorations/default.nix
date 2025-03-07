{lib, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      decoration = {
        rounding = 10;
        dim_inactive = true;
        dim_strength = 0.1;
        shadow = {
          enabled = true;
          range = 30;
          render_power = 3;
          color = lib.mkForce "0x66000000";
        };
        blur = {
          enabled = true;
          size = 6;
          passes = 2;
          ignore_opacity = 1;
          xray = true;
          new_optimizations = 1;
          noise = 3.0e-2;
          contrast = 1.0;
        };
      };
    };
  };
}
