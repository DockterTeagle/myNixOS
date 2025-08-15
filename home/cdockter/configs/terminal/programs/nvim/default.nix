{ pkgs, ... }:
{
  home.file.".config/nvim".source = ./.;
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    withNodeJs = true;
  };
  home.packages = with pkgs; [
    git-absorb
    tree-sitter
    inotify-tools
    xdotool # for vimtex
    # neovim
  ];
}
