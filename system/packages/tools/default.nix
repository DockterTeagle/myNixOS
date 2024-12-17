{ pkgs, ... }:
{
  imports = [
    ./neovim
  ];
  environment.systemPackages = with pkgs; [
    pstree
    zulu
    languagetool
    obsidian
    just
    gcc
  ];
}
