{
  pkgs,
  mainUserSettings,
  ...
}:
{
  programs.rofi = {
    enable = true;
    # package = pkgs.tofi;rofi
    package = pkgs.rofi-wayland.override { plugins = [ pkgs.rofi-emoji ]; };

    terminal = "${pkgs.kitty}/bin/kitty";
    location = "center";
  };
}
