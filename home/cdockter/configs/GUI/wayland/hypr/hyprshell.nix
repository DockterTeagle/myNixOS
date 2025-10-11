{ inputs, pkgs, ... }:
{
  imports = [ inputs.hyprshell.homeModules.hyprshell ];
  programs.hyprshell = {
    enable = true;
    hyprland = inputs.hyprland.packages.${pkgs.system}.default;
    systemd.args = "-vv";
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
