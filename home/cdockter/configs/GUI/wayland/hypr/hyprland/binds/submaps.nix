{
  wayland.windowManager.hyprland.extraConfig =
    #hyprlang
    ''
      bindl = $mainMod,z,submap,system
      submap = system
      bind = ,l,exec,hyprlock
      bind = ,q,exec,loginctl terminate-session "$XDG_SESSION_ID"
      bind = ,escape,submap,reset
      submap = reset
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
      bind = ,r,submap,resize
      submap = resize
      binde = ,h,resizeactive,-10 0
      binde = ,k,resizeactive,0 -10
      binde = ,j,resizeactive,0 10
      binde = ,l,resizeactive,10 0
      bind = ,catchall,submap,prefix
      submap = prefix
      bind = ,escape,submap,reset
      submap = reset
    '';
}
