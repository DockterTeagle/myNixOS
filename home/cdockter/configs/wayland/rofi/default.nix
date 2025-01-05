{ pkgs, cdockterSettings, ... }:
{
  programs.rofi = {
    enable = true;
    # package = pkgs.tofi;
    package = pkgs.rofi-wayland;

    extraConfig = {
      run-command = "uwsm app -- {cmd}";
      run-shell-command = "ghostty --hold {cmd}";
      run-shell = "{cmd}";
    };
    terminal = "${cdockterSettings.term}";
    location = "center";
  };
}
