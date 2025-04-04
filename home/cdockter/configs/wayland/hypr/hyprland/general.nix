{cdockterSettings, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false; #using uwsm
    package = null;
    portalPackage = null;
    settings = {
      "$mainMod" = "SUPER_L"; # Mod key(or windows key if you are a heathen)
      "$term" = "${cdockterSettings.term}"; # terminal
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
      gestures = {
        workspace_swipe = "off";
      };
      cursor = {
        no_hardware_cursors = false;
      };
      render = {
        direct_scanout = 1;
      };
      input = {
        accel_profile = "flat";
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
        sensitivity = 0.0;
      };
      misc = {
        disable_hyprland_logo = true; # sorry vaxry
        disable_splash_rendering = true;
        animate_mouse_windowdragging = true;
        animate_manual_resizes = true;
      };
    };
  };
}
