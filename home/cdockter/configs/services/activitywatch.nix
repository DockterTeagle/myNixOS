{pkgs, ...}: {
  services.activitywatch = {
    package = pkgs.aw-server-rust;
    enable = true;
    watchers = {
      # aw-watcher-afk = {
      #   package = pkgs.aw-watcher-afk;
      #   settings = {
      #     timeout = 300;
      #     poll_time = 2;
      #   };
      # };

      aw-watcher-window-wayland = {
        package = pkgs.aw-watcher-window-wayland;
        settings = {
          poll_time = 1;
          # exclude_title = true;
        };
      };
    };
    # settings = {
    #   port = 3012;
    # };
  };
}
