{ pkgs, cdockterSettings, ... }:
{
  programs.rofi = {
    enable = true;
    # package = pkgs.tofi;rofi
    package = pkgs.rofi-wayland;

    extraConfig = {
      run-command = "uwsm app -- {cmd}";
    };
    terminal = "${cdockterSettings.term}";
    location = "center";
  };
}
