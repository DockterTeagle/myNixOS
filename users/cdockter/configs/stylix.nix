{
  pkgs,
  cdockterSettings,
  ...
}:
{
  stylix = {
    autoEnable = true;
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    image = ../../../pictures/black-hole-cosmic-3840x2160-19145.jpg;
    targets = {
      neovim.enable = false;
      tmux.enable = false;
      kitty.enable = false;
      hyprland.enable = false;
      hyprlock.enable = false;
      hyprpaper.enable = false;
      waybar = {
        enable = false;
        # enableCenterBackColors = true;
        # enableLeftBackColors = true;
        # enableRightBackColors = true;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      sizes = {
        terminal = 15;
        # applications = 15;
        desktop = 11;
        popups = 11;
      };
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "${cdockterSettings.font}";
      };
    };
  };
}
