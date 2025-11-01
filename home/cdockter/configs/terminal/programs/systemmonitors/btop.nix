{ pkgs, ... }:
{
  programs.btop = {
    enable = true;
    package = pkgs.btop.override { cudaSupport = true; };
    settings = {
      vim_keys = true;
      update_ms = 200;
      shown_boxes = "proc cpu mem net gpu0";
      base_10_sizes = true;
      background_update = false;
      zfs_arc_cached = false;
      show_battery = false;
      log_level = "DEBUG";
    };
  };
}
