{ pkgs, ... }:
{

  stylix = {
    image = ../users/cdockter/configs/terminal/fastfetch/images/NixOS.png;
    enable = true;
    fonts = {
      sizes = {
        terminal = 15;
        # applications = 15;
        # desktop = 11;
        # popups = 11;
      };
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font ";
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    targets = {
      regreet.enable = true;
      plymouth = {
        enable = true;
        logoAnimated = true;
      };
    };
  };
}
