{ pkgs, cdockterSettings, ... }:
{
  imports = [ ./tofi.nix ];
  home.packages = with pkgs; [
    rofi-power-menu
  ];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-power-menu
    ];
    extraConfig = {
      modi = "drun,power-menu:rofi-power-menu,filebrowser"; # Add both drun and power-menu
      show = "drun"; # Set the default mode to drun
      run-command = "uwsm app -- {cmd}";
      run-shell-command = "ghostty -e {cmd}";
      kb-mode-next = "Alt+Tab";
    };
    terminal = "${cdockterSettings.term}";
    location = "center";
  };
}
