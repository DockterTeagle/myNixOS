{ cdockterSettings, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    package = null;
    portalPackage = null;
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        layout = "dwindle";
        resize_on_border = false;
        allow_tearing = true;
      };
      "$mainMod" = "SUPER_L"; # Mod key(or windows key if you are a heathen)
      # "$secondMod" = "SUPER_R";
      "$term" = "${cdockterSettings.term}"; # terminal
      ecosystem = {
        # enforce_permissions = true;
        #TODO: enforce permission
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
      };
      master = {
        new_status = "master";
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
          scale = 1.50;
        }
      ];
      env = [ "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1" ];
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
