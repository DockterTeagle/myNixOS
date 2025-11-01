{
  pkgs,
  cdockterSettings,
  ...
}:
{
  stylix = {
    enable = true;
    base16Scheme = cdockterSettings.theme;
    image = ../../../assets/wallpaper-dread.png;
    targets = {
      neovim.enable = false;
      zen-browser = {
        profileNames = [ "default" ];
      };
      firefox.enable = false;
    };

    cursor = {
      package = cdockterSettings.cursorPackage;
      name = cdockterSettings.cursorName;
      size = cdockterSettings.cursorSize;
    };
    fonts = {
      sizes = {
        terminal = 15;
        # applications = 15;
        desktop = 11;
        popups = 11;
      };
      emoji = {
        package = pkgs.noto-fonts-monochrome-emoji;
        name = "Noto Monochrome Emoji";
      };
      monospace = {
        package = cdockterSettings.nerdfont;
        name = cdockterSettings.font;
      };
    };
  };
}
