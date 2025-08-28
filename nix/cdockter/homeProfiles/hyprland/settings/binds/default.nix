{
  wayland.windowManager.hyprland.settings = {
    bind = [
      #shortcuts
      "$mainMod,c,killactive,"
      "$mainMod, v, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
      "$mainMod,h,movefocus,l"
      "$mainMod,j,movefocus,d"
      "$mainMod,k,movefocus,u"
      "$mainMod,l,movefocus,r"
    ];
  };
}
