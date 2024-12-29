{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    # package = pkgs.tofi;rofi
    package = pkgs.rofi-wayland;

    extraConfig = {
      run-command = "uwsm app -- {cmd}";
    };
    terminal = "${pkgs.kitty}/bin/kitty";
    location = "center";
  };
}
