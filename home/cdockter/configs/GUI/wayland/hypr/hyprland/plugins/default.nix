{ inputs', ... }:
{
  wayland.windowManager.hyprland.plugins = with inputs'; [
    Hyprspace.packages.Hyprspace
    split-monitor-workspaces.packages.split-monitor-workspaces
  ];
}
