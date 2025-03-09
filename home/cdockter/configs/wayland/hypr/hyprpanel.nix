{cdockterSettings, ...}: {
  programs.hyprpanel = {
    # Enable the module.
    # Default: false
    enable = true;
    overlay.enable = true;

    # Add '/nix/store/.../hyprpanel' to the
    # 'exec-once' in your Hyprland config.
    # Default: false
    hyprland.enable = true;

    theme = "tokyo_night";

    layout = {
      bar.layouts = {
        "*" = {
          left = [
            "dashboard"
            "workspaces"
            "ram"
          ];
          # middle = ["systray"];
          middle = [];
          right = [
            "volume"
            "network"
            "bluetooth"
            "clock"
            "notifications"
          ];
        };
      };
    };
    settings = {
      scalingPriority = "both";
      tear = true;
      bar = {
        workspaces = {
          monitorSpecific = false;
          showWsIcons = true;
          showApplicationIcons = true;
        };
        media.show_active_only = true;
        customModules = {
        };
        workspaces.show_icons = true;
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
          # shortcuts = {
          #   enabled = false;
          # };
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
