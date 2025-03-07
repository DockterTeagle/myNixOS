{
  # inputs,
  cdockterSettings,
  ...
}: {
  imports = [
    ./animations
    ./binds
    ./decorations
    ./windows
    ./general.nix
    ./autostart.nix
    ./windowrules.nix
  ];
  wayland.windowManager.hyprland = {
    # plugins = with inputs; [
    #   hy3.packages.x86_64-linux.hy3
    # ];

    settings = {
      # debug = {
      #   disable_logs = false;
      # };
      # plugin = {
      #   hy3 = {
      #     autotile = {
      #       enable = true;
      #     };
      #   };
      # }; # configure plugins here

      "$mainMod" = "SUPER_L"; # Mod key(or windows key if you are a heathen)
      "$term" = "${cdockterSettings.term}"; # terminal
    };
  };
}
