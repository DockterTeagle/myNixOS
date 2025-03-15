{
  pkgs,
  cdockterSettings,
  ...
}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
    image = ../../../assets/pictures/wallpaper-dread.png;
    # image = pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/refs/heads/master/wallpapers/nixos-wallpaper-catppuccin-mocha.png";
    #   sha256 = "7e6285630da06006058cebf896bf089173ed65f135fbcf32290e2f8c471ac75b";
    # };
    targets = {
      neovim.enable = false;
      # tmux.enable = false;
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
        package = pkgs.${cdockterSettings.nerdfont};
        name = cdockterSettings.font;
      };
    };
  };
}
