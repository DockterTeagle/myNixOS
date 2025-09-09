{ inputs, pkgs, ... }:
{
  imports = [ inputs.hyprshell.homeModules.hyprshell ];
  programs.hyprshell = {
    enable = true;
    hyprland = inputs.hyprland.packages.${pkgs.system}.default;
    settings = {
      windows = {
        enable = true; # please dont forget to enable windows if you want to use overview or switch
        overview = {
          enable = true;
          key = "super_l";
          modifier = "super";
          launcher = {
            max_items = 6;
          };
        };
        switch.enable = true;
      };
    };
  };
}
