{
  pkgs,
  cdockterSettings,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      show = "drun"; # Set the default mode to drun
      run-command = "uwsm app -- {cmd}";
      run-shell-command = "ghostty -e {cmd}";
      kb-mode-next = "Alt+Tab";
    };
    terminal = "${cdockterSettings.term}";
    location = "center";
  };
}
