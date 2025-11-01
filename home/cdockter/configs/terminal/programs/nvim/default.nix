{ pkgs, ... }:
{
  home.file.".config/nvim".source = ./.;
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    viAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    withNodeJs = true;
    extraLuaConfig = ''vim.g.sqlite_clib_path = ${pkgs.sqlite.out}/lib/sqlite.so'';
  };
  #NOTE: NONE OF ME ARE MODULES --check date 08/22/25
  home.packages = with pkgs; [
    # git-absorb
    tree-sitter
    sqlite
    xdotool
    /*
      sqlite_orm
      sqlitestudio
      sqlite-web
      luajitPackages.sqlite
      sqlitecpp
      xdotool # for vimtex
    */

  ];
}
