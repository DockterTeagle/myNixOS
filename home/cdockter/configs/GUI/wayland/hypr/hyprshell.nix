{ inputs, pkgs, ... }:
{
  imports = [ inputs.hyprshell.homeModules.hyprshell ];
  programs.hyprshell = {
    enable = true;
    inherit (inputs.hyprland.packages.${pkgs.system}) hyprland;
    settings = {
      windows = {
        enable = true;
        overview = {
          enable = true;
          key = "super_l";
          modifier = "alt";
          launcher = {
            max_items = 6;
            default_terminal = "ghostty";
          };
        };
        switch.enable = true;
      };
    };
  };
}
