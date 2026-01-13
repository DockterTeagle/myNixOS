{
  imports = [
    ./workspaces.nix
    ./media.nix
    ./mouse.nix
    ./shortcuts.nix
    ./submaps.nix
  ];
  wayland.windowManager.hyprland.settings = {
    bindr = [ "SUPER_L,SUPER_L,exec,noctalia-shell ipc call launcher toggle" ];
    bind = [
      #shortcuts
      "$mainMod,c,killactive,"
      # "$mainMod,F1,exec,noctalia-shell ipc call 'plugin:keybind-cheatsheet' 'toggle'"
      "$mainMod, v, exec, noctalia-shell ipc call launcher clipboard"
      "$mainMod,h,movefocus,l"
      "$mainMod,j,movefocus,d"
      "$mainMod,k,movefocus,u"
      "$mainMod,l,movefocus,r"
    ];
  };
}
