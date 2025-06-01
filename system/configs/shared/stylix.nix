{cdockterSettings, ...}: {
  stylix = {
    image = ../../../assets/pictures/wallpaper-dread.png;
    enable = true;
    polarity = "dark";
    fonts = {
      sizes = {
        terminal = 15;
        # applications = 15;
        desktop = 11;
        popups = 11;
      };
      monospace = {
        package = cdockterSettings.nerdfont;
        name = "${cdockterSettings.font}";
      };
    };
    cursor = {
      package = cdockterSettings.cursorPackage;
      name = cdockterSettings.cursorName;
      size = cdockterSettings.cursorSize;
    };
    base16Scheme = cdockterSettings.theme;
    targets = {
      grub = {
        enable = true;
        useImage = true;
      };
      plymouth = {
        enable = true;
        logoAnimated = true;
      };
    };
  };
}
