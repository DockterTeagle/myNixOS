{ pkgs, ... }:
{
  programs.neovim =
    {
      package = pkgs.neovim;
      enable = true;
      defaultEditor = true;
      withNodeJs = true;
    };
}
