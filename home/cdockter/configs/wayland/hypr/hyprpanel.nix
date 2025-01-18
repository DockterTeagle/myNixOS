{ cdockterSettings, ... }:
{
  programs.hyprpanel = {
    # Enable the module.
    # Default: false
    enable = true;
    overlay.enable = true;

    # Automatically restart HyprPanel with systemd.
    # Useful when updating your config so that you
    # don't need to manually restart it.
    # Default: false
    # systemd.enable = true;

    # Add '/nix/store/.../hyprpanel' to the
    # 'exec-once' in your Hyprland config.
    # Default: false
    hyprland.enable = true;

    # Fix the overwrite issue with HyprPanel.
    # See below for more information.
    # Default: false
    overwrite.enable = true;
    theme = "tokyo_night";

    layout = {
      "bar.layouts" = {
        "*" = {
          left = [
            "dashboard"
            "workspaces"
          ];
          middle = [ ];
          right = [
            # "systray"
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
          # icons = {
          #   active = " ";
          # };
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
          shortcuts = {
            enabled = false;
          };
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
