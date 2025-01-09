{
  pkgs,
  cdockterSettings,
  ...
}:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
    image = ../../../assets/pictures/black-hole-cosmic-3840x2160-19145.jpg;
    targets = {
      neovim.enable = false;
      tmux.enable = false;
      # kitty.enable = false;
      hyprland = {
        enable = true;
        hyprpaper.enable = false;
      };
      hyprlock.enable = false;
      hyprpaper.enable = false;
      rofi.enable = true;
      waybar = {
        enable = false;
        # enableCenterBackColors = true;
        # enableLeftBackColors = true;
        # enableRightBackColors = true;
      };
    };

    cursor = {
      package = pkgs.${cdockterSettings.cursorPackage};
      name = "${cdockterSettings.cursorName}";
      size = 24;
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
        name = "${cdockterSettings.font}";
      };
    };
  };
}
