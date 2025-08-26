
{
  inputs,
  pkgs
}:
{
    imports = [ inputs.stylix.homeModules.stylix ];
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
    image = ./wallpaper-dread.png;
    targets = {
      neovim.enable = false;
      zen-browser = {
        profileNames = [ "default" ];
      };
      firefox.enable = false;
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
