{ pkgs, cdockterSettings, ... }:
{
  imports = [ ./tofi.nix ];
  programs.rofi = {
    enable = true;
    # package = pkgs.tofi;
    package = pkgs.rofi-wayland;

    extraConfig = {
      run-command = "uwsm app -- {cmd}";
      run-shell-command = "kitty --hold {cmd}";
    };
    terminal = "${cdockterSettings.term}";
    location = "center";
  };
}