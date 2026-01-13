{ pkgs, inputs, ... }:
{
  home.file.".config/nvim".source = ./.;
  programs.neovim = {
    enable = true;
    waylandSupport = true;
    package = pkgs.neovim-nightly;
    # extraPackages = with pkg; [ sqlite ];
    # extraLuaConfig = # lua
    #   lib.mkAfter "vim.g.sqlite_clib_path = '${pkgs.sqlite.out}/lib/libsqlite3${pkgs.stdenv.hostPlatform.extensions.sharedLibrary}'";
    viAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    # withNodeJs = true;
  };
  #NOTE: NONE OF ME ARE MODULES --check date 08/22/25
  home.packages = with pkgs; [
    sqlite
    xdotool
    inotify-tools
    imagemagick
    ghostscript
    mermaid-cli
    inputs.tree-sitter.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
