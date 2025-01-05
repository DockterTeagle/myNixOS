{ cdockterSettings, ... }:
{
  programs.tofi = {
    settings = {
      font = "${pkgs.${cdockterSettings.font}}/share/fonts/truetype/NerdFonts/JetBrainsMono";
    };
  };
}
