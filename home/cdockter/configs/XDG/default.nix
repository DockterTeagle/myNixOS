{ config, ... }:
{
  xdg = {
    # portal = {
    #   enable = true;
    #   config.hyprland = {
    #     default = [
    #       "hyprland"
    #       "gtk"
    #     ];
    #     "org.freedesktop.impl.portal.ScreenCast" = [
    #       "gnome"
    #     ];
    #   };
    #   extraPortals = with pkgs; [
    #     xdg-desktop-portal-gnome
    #     xdg-desktop-portal-gtk
    #     xdg-desktop-portal-wlr
    #   ];
    # };
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
