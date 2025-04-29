{
  wayland.windowManager.hyprland.extraConfig =
    #hyprlang
    ''
      bindl = $mainMod,space,exec, echo "PREFIX">/tmp/hypr-submap; hyprctl dispatch submap prefix
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
}
