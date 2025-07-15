{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git-absorb
    tree-sitter
    inotify-tools
    xdotool # for vimtex
    neovim
  ];
}
