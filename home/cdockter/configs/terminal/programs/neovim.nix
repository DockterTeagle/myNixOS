{ pkgs, ... }:
{
  programs.neovim = {
    package = pkgs.neovim;
    # package = inputs.nvimconfig.packages.${systemSettings.system}.default;
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    vimdiffAlias = true;
    vimAlias = true;
  };
}