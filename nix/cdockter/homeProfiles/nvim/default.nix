{ pkgs, inputs, ... }:
{
  home.file.".config/nvim".source = ./.;
  programs.neovim = {
    enable = true;
    package = inputs.${pkgs.system}.neorocks.packages.neovim-nightly;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    withNodeJs = true;
  };
  #NOTE: NONE OF ME ARE MODULES --check date 08/22/25
  home.packages = with pkgs; [
    git-absorb
    tree-sitter
    # xdotool # for vimtex
  ];
}
