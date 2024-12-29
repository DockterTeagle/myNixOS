{
  # inputs,
  cdockterSettings,
  ...
}:
{
  wayland.windowManager.hyprland = {
    # plugins = with inputs.hyprland-plugins.packages.x86_64-linux; [
    #   inputs.hy3.packages.x86_64-linux.hy3
    #   hyprbars
    # ];

    extraConfig =
      #hyprlang
      ''
          bind = $mainMod,space,submap, prefix
          submap = prefix
          bind = SHIFT,z,fullscreen,1 
          bind = ,z,fullscreen,
          # add more later
        #also add an indicator somewhere
          bind = ,escape,submap,reset 
          # bind = ,catchall, submap, reset
          submap = reset
      '';
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
    settings = {
      # debug = {
      #   disable_logs = false;
      # };
      plugin = {
        hy3 = { };
      }; # configure plugins here
      general = {
        # layout = "hy3";
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

        follow_mouse = "1";

        touchpad = {
          disable_while_typing = true;
          natural_scroll = "yes";
        };
        sensitivity = "0.25";
      };
      decoration = {
        rounding = 0;
        dim_inactive = true;
        dim_strength = 0.1;
        # drop_shadow = 1;
        # shadow_range = 20;
        # shadow_render_power = 2;
        # shadow_offset = "0 0";
        blur = {
          enabled = 1;
          size = 4;
          passes = 4;
          ignore_opacity = 1;
          xray = 1;
          new_optimizations = 1;
          noise = 3.0e-2;
          contrast = 1.0;
        };
      };
      animations = {
        enabled = true;
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
      gestures = {
        workspace_swipe = "off";
      };

      "$mainMod" = "SUPER_L"; # Mod key(or windows key if you are a heathen)
      "$terminal" = "${cdockterSettings.term}"; # Terminal

      exec-once = [
        # "uwsm app -- hypridle"
        # "uwsm app -- nm-applet"
        # "uwsm app -- waybar"
        "hyprctl setcursor phinger-cursors-light 24"
        # "cb"cb
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "hyprpaper"
        # "uwsm app -- steam"
        # "uwsm app -- $terminal"
        # "uwsm app -- discord --enable-features=UseOzonePlatform --ozone-platform=wayland"
        # "uwsm app -- firefox"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        # "$mainMod, mouse:272, hy3:movewindow"
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindr = [
        # "SUPER_L,$mainMod,exec,tofi-run --font${pkgs.nerdfonts.override{fonts = [cdockterSettings.nerdfont];}}/share/fonts/${cdockterSettings.nerdfont}-Regular.ttf"
        # "SUPER_L,$mainMod,exec,tofi-run "
        "SUPER_L,$mainMod,exec,rofi -show run"
      ];
      bindl = [
        "$mainMod,l,exec,uwsm stop"
      ];
      bind = [
        # ",121,exec,pamixer -t"
        ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume,exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86MonBrightnessDown,exec,brightnessctl s 5%-"
        ",XF86MonBrightnessUp,exec,brightnessctl s +5%"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",Print,exec,grimblast save screen |wl-copy -t image/png"
        #manage workspaces
        "$mainMod , 1, workspace, 1"
        "$mainMod , 2, workspace, 2"
        "$mainMod , 3, workspace, 3"
        "$mainMod , 4, workspace, 4"
        "$mainMod , 5, workspace, 5"
        "$mainMod , 6, workspace, 6"
        "$mainMod , 7, workspace, 7"
        "$mainMod , 8, workspace, 8"
        "$mainMod , 9, workspace, 9"
        "$mainMod , 0, workspace, 10"
        #shortcuts
        "$mainMod_SHIFT,l,exec,hyprlock"
        "$mainMod,q,exec,$terminal"
        "$mainMod_SHIFT,s,exec,hyprshot -m region"
        # "$mainMod_SHIFT,F,fullscreen, 1"
        # "$mainMod , F, fullscreen"
        "$mainMod,D,exec,uwsm app -- discord --enable-features=UseOzonePlatform --ozone-platform=wayland"
        "$mainMod,c,killactive,"
        "$mainMod, v, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      ];
      windowrulev2 = [ "idleinhibit focus, class:^steam_app_.*$" ];
    };
  };
}
