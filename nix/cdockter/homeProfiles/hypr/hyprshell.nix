{
  services.hyprshell = {
    enable = true;
    style = ./styles.css;
    settings = {
      layerrules = true;
      kill_bind = "ctrl+shift+alt,h";
      version = 1;
      windows = {
        scale = 8.5;
        items_per_row = 5;
        overview = {
          strip_html_from_workspace_title = true;
          key = "super_l";
          modifier = "super";
          hide_filtered = false;
          launcher = {
            launch_modifier = "ctrl";
            width = 650;
            max_items = 5;
            show_when_empty = true;
            animate_launch_ms = 250;
          };
        };
      };
    };
    systemd.enable = true;
  };
}
