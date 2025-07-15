{
  imports = [
    ./workspaces.nix
    ./media.nix
    ./mouse.nix
    ./shortcuts.nix
    ./submaps.nix
  ];
  wayland.windowManager.hyprland.settings = {
    bindr = [
      "SUPER_L,$mainMod,exec,fuzzel"
    ];
    bind = [
      #shortcuts
      "$mainMod,c,killactive,"
      "$mainMod, v, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
      "$mainMod,h,movefocus,l"
      "$mainMod,j,movefocus,d"
      "$mainMod,k,movefocus,u"
      "$mainMod,l,movefocus,r"
      "$mainMod_SHIFT,h,movetoworkspace,-1"
      "$mainMod_SHIFT,l,movetoworkspace,+1"
    ];
  };
}
