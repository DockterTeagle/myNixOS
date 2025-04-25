{
  imports = [
    ./workspaces.nix
    ./media.nix
    ./mouse.nix
    ./shortcuts.nix
    ./submaps.nix
  ];
  /**/
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
