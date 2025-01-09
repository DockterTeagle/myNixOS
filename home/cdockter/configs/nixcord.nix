{ pkgs, ... }:
{
  programs.nixcord = {
    enable = true;
    discord.vencord.package = pkgs.vencord;
    vesktop.enable = true;
  };
}
