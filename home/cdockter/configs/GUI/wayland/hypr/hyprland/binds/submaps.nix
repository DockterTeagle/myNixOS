{
  wayland.windowManager.hyprland.extraConfig =
    #hyprlang
    ''
      bindl = $mainMod,space,submap, prefix
      submap = prefix,reset
      bind = SHIFT,z,fullscreen,
      bind = ,z,fullscreen,1
      bind = ,d,exec,loginctl lock-session
      bind = ,1,split-workspace,1
      bind = ,,split-workspace,2
      bind = ,r,submap,resize
      submap = resize
      binde = ,h,resizeactive,-10 0
      binde = ,k,resizeactive,0 -10
      binde = ,j,resizeactive,0 10
      binde = ,l,resizeactive,10 0
      bindr = ,catchall,submap,prefix
      submap = prefix
      bindr = ,catchall,submap,reset
      bind = ,escape,submap,reset
      submap = reset
    '';
}
