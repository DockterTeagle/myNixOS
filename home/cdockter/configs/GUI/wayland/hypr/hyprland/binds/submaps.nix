{
  wayland.windowManager.hyprland.extraConfig =
    #hyprlang
    ''
      bindl = $mainMod,z,submap,system
      submap = system
      bind = ,l,exec,hyprlock
      bindl = ,escape,submap,reset
      submap = reset
      bindl = $mainMod,space,submap, prefix
      submap = prefix,reset
      bind = SHIFT,z,fullscreen,
      bind = ,z,fullscreen,1
      bindl = SHIFT,l,exec,uwsm stop
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
