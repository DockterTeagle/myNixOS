{ pkgs, inputs }:
{
  programs.neovim =
    let
      toLuaFile = file: "lua << EOF\n${builtins.readFile}\nEOF\n";
    in
    {
      enable = true;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [
        { }
      ];
    };
}
