{ cdockterSettings, inputs', ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false; # using uwsm
    package = inputs'.hyprland.packages.hyprland;
    portalPackage = inputs'.hyprland.packages.xdg-desktop-portal-hyprland;
    settings = {
      general = {
        gaps_in = 10;
        gaps_out = 14;
        border_size = 3;
        layout = "dwindle";
        resize_on_border = true;
      };
      "$mainMod" = "SUPER_L"; # Mod key(or windows key if you are a heathen)
      "$secondMod" = "SUPER_R";
      "$term" = "${cdockterSettings.term}"; # terminal
      env = [
        "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
      ];
      ecosystem = {
        # enforce_permissions = true;
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        # smart_split = true;
      };
      gestures = {
        workspace_swipe = "off";
      };
      cursor = {
        no_hardware_cursors = 1;
      };
      render = {
        direct_scanout = 2;
      };
      monitorv2 = [
        {
          output = "eDP-1";
          mode = "1920x1080@144";
          position = "0x0";
          scale = 1;
        }
        {
          output = "HDMI-A-1";
          mode = "3840x2160@60";
          position = "1920x0";
          scale = 1.5;
        }
      ];
      input = {
        accel_profile = "flat";
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
