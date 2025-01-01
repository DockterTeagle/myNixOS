{ pkgs, ... }:
{
  imports = [
    ./neovim
    ./shell
  ];
  environment.systemPackages = with pkgs; [
    pstree
    gnumake
    texlive.combined.scheme-full
    zulu
    languagetool
    obsidian
    just
  ];
}
