{ cdockterSettings, ... }:
{
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
              "workspaces"
            ];
            middle = [
              "submap"
              # "media"
              # "battery"
            ];
            right = [
              # "bluetooth"
              "clock" # truncate me somehow?
              "notifications"
            ];
          };
        };
        windowtitle.label = true;
        media.show_active_only = true;
        launcher = {
          autoDetectIcon = true;
        };
      };
      menus = {
        # power.logout = "uwsm stop";
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
