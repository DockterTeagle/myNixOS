{
  pkgs,
  cdockterSettings,
  ...
}: {
  stylix = {
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/refs/heads/master/wallpapers/nixos-wallpaper-catppuccin-mocha.png";
      sha256 = "7e6285630da06006058cebf896bf089173ed65f135fbcf32290e2f8c471ac75b";
    };
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
