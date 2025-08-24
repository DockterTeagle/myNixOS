{ cdockterSettings, pkgs, ... }:
{
  stylix = {
    enable = true;
    image = ../../../assets/pictures/wallpaper-dread.png;
    polarity = "dark";
    autoEnable = true;
    fonts = {
      sizes = {
        terminal = 15;
        # applications = 15;
        desktop = 11;
        popups = 11;
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "${cdockterSettings.font}";
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = cdockterSettings.cursorName;
      size = cdockterSettings.cursorSize;
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
    targets = {
      plymouth = {
        enable = true;
        logoAnimated = true;
      };
    };
  };
}
