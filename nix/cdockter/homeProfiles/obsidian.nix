{ pkgs, ... }:
{
  home.packages = with pkgs; [ obsidian ];
  # programs.obsidian = {
  #   enable = true;
  #   # vaults = {
  #   #   "main" = {
  #   #     enable = true;
  #   #     target = "Documents/Obsidian/main";
  #   #   };
  #   # };
  # };
}
