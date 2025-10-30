{ pkgs, ... }:
let
  cdockterSettings = {
    username = "cdockter";
    email = "65212972+DockterTeagle@users.noreply.github.com";
    term = "ghostty";
    editor = "nvim";
    font = "JetBrainsMono NF";
    nerdfont = pkgs.nerd-fonts.jetbrains-mono;
    homeDirectory = "/home/cdockter";
    cursorPackage = pkgs.bibata-cursors;
    cursorName = "Bibata-Modern-Ice";
    cursorSize = 24;
    theme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
  };
in
{
  inherit cdockterSettings;
}
