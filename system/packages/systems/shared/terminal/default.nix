{ pkgs, ... }:
{
  imports = [
    ./shell
    ./neovim
  ];
  environment.systemPackages = with pkgs; [
    pstree
    gnumake
    zulu
    languagetool
    obsidian
    # just
    ncdu
  ];
}
