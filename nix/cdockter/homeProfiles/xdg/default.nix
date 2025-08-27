{ config, ... }:
{
  xdg = {
    userDirs = {
      enable = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/Pictures/Screenshots";
      };
      createDirectories = false;
      pictures = "${config.home.homeDirectory}/Pictures";
    };
  };
}
