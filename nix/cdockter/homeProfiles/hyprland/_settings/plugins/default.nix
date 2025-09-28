{
  inputs,
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    plugins = with inputs; [
      split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];
    settings = {
      plugin = {
        split-monitor-workspaces = {
          count = 5;
          keep_focused = 0;
        };
      };
    };
  };
}
