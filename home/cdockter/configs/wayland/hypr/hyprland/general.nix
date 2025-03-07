{
  wayland.windowManager.hyprland = {
    settings = {
      general = {
        # layout = "hy3";
        layout = "dwindle";
      };
      cursor = {
        no_hardware_cursors = 1;
      };
      render = {
        direct_scanout = 1;
      };
      input = {
        monitor = [
          "eDP-1, 1920x1080@144 , 0x0, 1"
          "HDMI-A-1, 3840x2160, 1920x0, 1.50"
        ];
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        numlock_by_default = true;

        follow_mouse = 1;

        touchpad = {
          disable_while_typing = true;
          natural_scroll = "yes";
        };
        sensitivity = "0.25";
      };
      misc = {
        disable_hyprland_logo = true; # sorry vaxry
        disable_splash_rendering = true;
      };
    };
  };
}
