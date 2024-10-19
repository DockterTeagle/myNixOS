{ systemSettings, pkgs, inputs, ... }:
{
  programs.neovim =
    {
      enable = true;
      defaultEditor = true;
      withNodeJs = true;
    };
}
