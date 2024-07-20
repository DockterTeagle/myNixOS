{ pkgs, ... }:
{
  programs.nixvim = {
    enabled = true;
    plugins = {
      conform-nvim = {
        enable = true;
        formattersByFt = {
          lua = [ "stylua" ];
        };
      };
    };
    extraPlugins = with pkgs.vimPlugins;[
      base46
      tokyonight
    ];
  };
}
