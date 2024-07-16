{ pkgs, inputs, ... }:
#TODO: add all the neovim plugins here
{
  programs.neovim =
    let
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
      enable = true;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [
        {
          plugin = telescope-nvim;
          config = toLuaFile ./NvChad/lua/plugins/Telescope/TelescopeOptions.lua;
        }
        {
          plugin = oil-nvim;
        }

      ];
    };
}
