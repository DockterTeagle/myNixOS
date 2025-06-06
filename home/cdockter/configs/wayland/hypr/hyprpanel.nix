{
  cdockterSettings,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [python313Packages.gpustat];
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
          stats.enable_gpu = true;
          directories.enabled = false;
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
