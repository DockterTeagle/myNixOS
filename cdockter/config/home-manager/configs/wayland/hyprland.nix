{...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      input = {
        monitor = [
        "eDP-1,3840x2400@60,0x0,2.00"
        "DP-5,3840x2160@59.997,1920x0,1.50"
        ];
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = "1"; #TODO: figure out what I do

        touchpad = {
          disable_while_typing = false;
          natural_scroll = "yes";
        };
        sensitivity = "0";
      };
      decoration = {
        rounding = "5";

        blur = {
          enabled = "false";
          size = "3";
          passes = "1";
        };

        drop_shadow = "yes";
        shadow_range = "4";
        shadow_render_power = "3";
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = "true";

        bezier = [
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
        ];

        animation = [
          "windows, 1, 5, overshot, slide"
          "windowsOut, 1, 4, smoothOut, slide"
          "windowsMove, 1, 4, default"
          "border, 1, 10, default"
          "fadeDim, 1, 10, smoothIn"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_is_master = "true";
      };

      gestures = {
        workspace_swipe = "off";
      };

      misc = {
        force_default_wallpaper = "0";
        disable_hyprland_logo = "true";
      };

      "$mainMod" = "SUPER"; # Mod key
      "$terminal" = "kitty"; # Terminal

      exec-once = [
        "ruin"
        "ssb"
        "[workspace 1 silent] $terminal"
      ];

      env = [
        "HYPRCURSOR_SIZE,24"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "WLR_NO_HARDWARE_CURSORS,1"
        "LIBVA_DRIVER_NAME,nvidia"
        "HYPRCURSOR_THEME,HyprBibataModernClassicSVG"
        # "WLR_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"
      ];
      
      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

    };
  };
}
