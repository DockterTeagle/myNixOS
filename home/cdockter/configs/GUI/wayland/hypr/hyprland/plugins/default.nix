{ inputs', ... }:
{
  # "$mainMod_SHIFT,h,split-movetoworkspace,-1"
  # "$mainMod_SHIFT,l,split-movetoworskpace,+1"
  # "$mainMod,w,overview,"
  wayland.windowManager.hyprland = {
    plugins = with inputs'; [
      Hyprspace.packages.Hyprspace
      split-monitor-workspaces.packages.split-monitor-workspaces
    ];
    settings = {
      plugin = {
        split-monitor-workspaces = {
          count = 5;
          keep_focused = 0;
        };
      };
      bindd = [
        # "$mainMod,w,overview,overview"
      ];
    };
  };
}
