{ pkgs, cdockterSettings, ... }:
{
  stylix = {
    image = ../../assets/pictures/black-hole-cosmic-3840x2160-19145.jpg;
    enable = true;
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
      package = pkgs.${cdockterSettings.cursorPackage};
      name = "${cdockterSettings.cursorName}";
      size = 24;
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
    targets = {
      grub = {
        enable = true;
        useImage = true;
      };
      regreet.enable = true;
      plymouth = {
        enable = true;
        logoAnimated = true;
      };
    };
  };
}
