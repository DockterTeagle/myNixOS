{ pkgs, ... }:
{
  programs.nixcord = {
    enable = true;
    discord.vencord.package = pkgs.vencord;
    vesktop.enable = true;
    config = {
      frameless = true;
      plugins = {
        blurNSFW.enable = true;
        alwaysAnimate.enable = true;
        anonymiseFileNames = {
          enable = true;
          anonymiseByDefault = true;
          # randomisedLength = true;
        };
      };
    };
  };
}
