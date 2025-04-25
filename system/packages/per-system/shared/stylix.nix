{
  pkgs,
  cdockterSettings,
  ...
}: {
  stylix = {
    image = ../../../../assets/pictures/wallpaper-dread.png;
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
        package = pkgs.nerd-fonts.${cdockterSettings.nerdfont};
        name = "${cdockterSettings.font}";
      };
    };
    cursor = {
      # package = pkgs.phinger-cursors;
      # name = "phinger-cursors-light";
      package = cdockterSettings.cursorPackage;
      name = cdockterSettings.cursorName;
      size = cdockterSettings.cursorSize;
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
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
