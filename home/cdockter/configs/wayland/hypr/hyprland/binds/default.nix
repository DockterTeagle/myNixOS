{
  imports = [
    ./workspaces.nix
    ./media.nix
    ./mouse.nix
    ./shortcuts.nix
    ./submaps.nix
  ];
  /*
  TODO: make an indicator to tell when in prefix/ special mode,
  also make it execute only one command at a time unless told to. Also
  make all binds have docs and a help key
  */
  wayland.windowManager.hyprland.settings = {
    bindr = [
      "SUPER_L,$mainMod,exec,rofi -show drun -show-icons run"
    ];
    bind = [
      #shortcuts
      "$mainMod,c,killactive,"
      "$mainMod, v, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
    ];
  };
}
