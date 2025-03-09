{
  wayland.windowManager.hyprland.settings.bindd = [
    ",XF86AudioMicMute, Mute mic,exec,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ",XF86AudioMute,Mute audio ,exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ",XF86AudioRaiseVolume, raise volume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
    ",XF86AudioLowerVolume,lower volume,exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
    ",XF86MonBrightnessDown,lower brightness,exec,brightnessctl s 5%-"
    ",XF86MonBrightnessUp,raise brightness,exec,brightnessctl s +5%"
    ",XF86AudioPlay, toggle media, exec, playerctl play-pause"
  ];
}
