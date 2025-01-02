{ pkgs, ... }:
{
  imports = [
    ./shell
    ./neovim
    ./ghostty.nix
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
