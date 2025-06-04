{
  wayland.windowManager.hyprland.extraConfig =
    #hyprlang
    ''
      bindl = $mainMod,space,submap, prefix
      submap = prefix
      bind = SHIFT,z,fullscreen,
      bind = ,z,fullscreen,1
      bindd = ,q,launch the terminal,exec,uwsm app -- $term
      bindd = ,D,launch discord,exec,uwsm app -- vesktop
      bindl = SHIFT,l,exec,uwsm stop
      bind =,comma,submap,special
      submap = special
      bind = ,F4,exec,[workspace special:bt silent] ghostty -e btop
      bind = CONTROL_L,l,togglespecialworkspace,bt
      bind = ,escape,submap,prefix
      bind = ,catchall, submap, prefix
      submap = prefix
      # add more later
      bind = ,escape,submap,reset
      bind = ,catchall, submap, reset
      submap = reset
    '';
}
