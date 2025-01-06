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
    zulu
    languagetool
    obsidian
    just
  ];
}
