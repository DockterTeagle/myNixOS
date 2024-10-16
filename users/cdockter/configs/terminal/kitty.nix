{ pkgs, config, mainUserSettings, ... }:
{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    # font.name = mainUserSettings.font;
    # font.size = 15;
    settings = {
      # "background_opacity" = 1;
      "confirm_os_window_close" = 0;
      "enable_audio_bell" = "no";
    };
    # themeFile = "tokyo_night_night";
  };
}
