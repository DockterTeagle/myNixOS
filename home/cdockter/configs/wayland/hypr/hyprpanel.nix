{cdockterSettings, ...}: {
  programs.hyprpanel = {
    enable = true;
    settings = {
      scalingPriority = "both";
      tear = true;
      bar = {
        layouts = {
          "*" = {
            left = [
              "dashboard"
              "workspaces"
            ];
            middle = [
              "windowtitle"
              "submap"
            ];
            right = [
              "network"
              "bluetooth"
              "clock"
              "notifications"
            ];
          };
        };
        windowtitle.label = false;
        workspaces = {
          monitorSpecific = false;
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
          directories.enabled = false;
          stats.enable_gpu = true;
          shortcuts.enabled = false;
        };
        transition = "crossfade";
      };
      theme = {
        name = "tokyo_night";
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
