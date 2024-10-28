{ pkgs, ... }:
{
  imports = [
    ./neovim
  ];
  environment.systemPackages = with pkgs; [
    pstree
    ranger
    zulu
    languagetool
  ];
}
