{ pkgs, ... }:
{
  home.file.".config/nvim".source = ../nvim;
  home.packages = with pkgs; [
    git-absorb
    tree-sitter
    inotify-tools
    xdotool # for vimtex
    neovim
  ];
}
