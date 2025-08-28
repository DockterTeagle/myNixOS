{
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
    overlays.enable = false;
    image = ./_img.png;
    targets = {
      plymouth.enable = true;
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
      emoji = {
        package = pkgs.noto-fonts-monochrome-emoji;
        name = "Noto Monochrome Emoji";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono NF";
      };
    };
  };
}
