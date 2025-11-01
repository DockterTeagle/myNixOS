{
  wayland.windowManager.hyprland.settings = {
    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
    bind = [
      "$mainMod,mouse_left, split-workspace,-1"
      "$mainMod,mouse_right, split-workspace,+1"
    ];
  };
}
