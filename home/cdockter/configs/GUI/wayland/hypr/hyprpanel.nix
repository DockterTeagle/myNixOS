{
  cdockterSettings,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [ python313Packages.gpustat ];
  programs.hyprpanel = {
    enable = true;
    settings = {
      OSD = {
        followCursor = false;
        monitor = 1;
      };
      scalingPriority = "both";
      tear = true;
      bar = {
        layouts = {
          "*" = {
            left = [
              "dashboard"
              "cputemp"
              "volume"
              "workspaces"
            ];
            middle = [
              "submap"
              "network"
            ];
            right = [
              "bluetooth"
              "clock"
              "notifications"
            ];
          };
        };
        windowtitle.label = false;
        workspaces = {
          show_icons = true;
        };
        media.show_active_only = true;
        launcher = {
          autoDetectIcon = true;
        };
      };
      menus = {
        power.logout = "uwsm stop";
        clock = {
          weather = {
            enabled = false;
          };
          time = {
            military = true;
            hideSeconds = true;
          };
        };
        dashboard = {
          stats.enable_gpu = true;
          directories.enabled = false;
          shortcuts.enabled = false;
        };
        transition = "crossfade";
      };
      theme = {
        bar = {
          transparent = true;
        };
        font = {
          name = cdockterSettings.font;
        };
      };
    };
  };
}
