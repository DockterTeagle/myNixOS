{
  # inputs,
  cdockterSettings,
  ...
}: {
  imports = [
    # ./animations
    ./decorations
    ./general.nix
  ];
  wayland.windowManager.hyprland = {
    # plugins = with inputs; [
    #   hy3.packages.x86_64-linux.hy3
    # ];

    package = null;
    portalPackage = null;
    extraConfig =
      #hyprlang
      ''
        bindl = $mainMod,space,submap, prefix
        submap = prefix
        bind = SHIFT,z,fullscreen,
        bind = ,z,fullscreen,1
        bindl = $mainMod,l,exec,uwsm stop
        bind =$mainMod,comma,submap,special
        submap = special
        bind = ,F4,exec,[workspace special:bt silent] ghostty -e btop
        bind = CONTROL,l,togglespecialworkspace,bt
        bind = ,escape,submap,prefix
        submap = prefix
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
      # plugin = {
      #   hy3 = {
      #     autotile = {
      #       enable = true;
      #     };
      #   };
      # }; # configure plugins here
      animations = {
        enabled = true;
        bezier = [
          "wind,0.05,0.9,0.1,1.05"
          "winIn,0.1,1.1,0.1,1.1"
          "winOut,0.3,-0.3,0,1"
          "liner,1,1,1,1"
        ];
        animation = [
          #animations-high.conf
          "windows,1,6,wind,slide"
          "windowsIn,1,6,winIn,slide"
          "windowsOut,1,5,winOut,slide"
          "windowsMove,1,5,wind,slide"
          "border,1,1,liner"
          "borderangle,1,30,liner,loop"
          "fade,1,10,default"
          "workspaces,1,5,wind"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
      gestures = {
        workspace_swipe = "off";
      };

      "$mainMod" = "SUPER_L"; # Mod key(or windows key if you are a heathen)
      "$term" = "${cdockterSettings.term}"; # terminal

      exec-once = [
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "systemctl --user enable --now hyprpolkitagent.service"
        "systemctl --user enable --now hyprsunset.service"
        "uwsm app -- $term"
        "uwsm app -- zen-twilight"
        "uwsm app -- vesktop"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        # "$mainMod, mouse:272, hy3:movewindow"
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindr = [
        "SUPER_L,$mainMod,exec,rofi -show drun -show-icons run"
      ];
      bind = [
        ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume,exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86MonBrightnessDown,exec,brightnessctl s 5%-"
        ",XF86MonBrightnessUp,exec,brightnessctl s +5%"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",Print,exec, grimblast save screen"
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
        "$mainMod,q,exec,uwsm app -- $term"
        "$mainMod_SHIFT,s,exec,grimblast save area"
        "$mainMod,D,exec,uwsm app -- vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland"
        "$mainMod,c,killactive,"
        "$mainMod, v, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      ];
      windowrulev2 = [
        "idleinhibit focus, class:^steam_app_.*$"
        "idleinhibit fullscreen,class:^(firefox|chromium|chrome)$, title:^(.*YouTube.*)$"
      ];
    };
  };
}
