{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = with inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}; [
      # hyprbars
      # hyprexpo
      # borders-plus-plus
      # # hyprtrails #FIXME: currently makes it impossible to login if enabled
      # hyprwinwrap
      # #hy3
    ];
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      # cursor = {
      #   no_hardwa
      # }
      input = {
        monitor = [
          "eDP-1, 1920x1080@144 , 0x0, 1"
          "HDMI-A-1, 3840x2160, 1920x0, 1.50"
          ",preferred,auto,1"
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
      gestures = {
        workspace_swipe = "off";
      };

      # misc = {
      #   force_default_wallpaper = "0";
      #   disable_hyprland_logo = "true";
      # };

      "$mainMod" = "SUPER_L"; # Mod key
      "$terminal" = "kitty"; # Terminal

      exec-once = [
        "[workspace 1 silent] $terminal"
        "waybar & hyprpaper & nm-applet --indicator"
        "firefox"
      ];

      env = [
        "HYPRCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,HyprBibataModernClassicSVG"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindr = [
        "SUPER,$mainMod,exec,kitty zsh -i -c 'source ~/.config/zsh/.zshrc && winfzf'"
      ];
      workspace = [
        "name:Name1,monitor:eDP-1"
        "name:Name2,monitor:HDMI-A-1"
        "name:Name3,monitor:eDP-1"
        "name:name4,monitor:HDMI-A-1"
      ];
      bind = [
        # ",121,exec,pamixer -t"
        ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume,exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86MonBrightnessDown,exec,brightnessctl s 5%-"
        ",XF86MonBrightnessUp,exec,brightnessctl s +5%"
        "ALT,Tab,cyclenext"
        "ALT,Tab,bringactivetotop"
        "ALT Shift,Tab,cyclenext,prev"
        ",Print,exec,grim -g \"$(slurp -d)\" - | wl-copy"
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
        "$mainMod , F, fullscreen"
        #key 172 is pause
        #shortcuts
        "$mainMod,l,exec,hyprctl dispatch exit"
        "$mainMod,q,exec,$terminal"
        "SUPER_SHIFT,F,exec,firefox"
        "$mainMod,D,exec,discord --enable-features=UseOzonePlatform --ozone-platform=wayland"
        "$mainMod,c,killactive,"
        "$mainMod,s,togglespecialworkspace,magic"
        "$mainMod,s,movetoworkspace, +0"
        "$mainMod,s,togglespecialworkspace,magic"
        "$mainMod,s,movetoworkspace,special:magic"
        "$mainMod,s,togglespecialworkspace,magic"
      ];
      # windowrulev2 = [ "suppressevent maximize, class:.*" ];
    };
  };
}
