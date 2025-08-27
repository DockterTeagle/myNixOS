{
  inputs,
  cell,
}:
let
  inherit (inputs) nixpkgs ;
  inherit (inputs.std.data) configs;
  inherit (inputs.std.lib.dev) mkNixago;
  pkgs = inputs.nixpkgs;
  # luarc-nightly = cell.toolchain.gen-luarc.mk-luarc {
  #   nvim = cell.toolchain.neovim.neovim-nightly;
  #   plugins = luarcPlugins;
  # };

  inherit (cell.nvimPlugins) plugins;
  luarc-nightly = cell.toolchain.gen-luarc.mk-luarc {
    nvim = cell.toolchain.neovim.neovim-nightly;
    inherit plugins;
  };
  /*
    While these are strictly specializations of the available
    Nixago Pebbles at `lib.cfg.*`, it would be entirely
    possible to define a completely new pebble inline
  */
in
{
  #
  treefmt =(mkNixago configs.treefmt){
      data = {
          formatter = {
          nixf-diagnose = {command = "nixf-diagnose";
          includes = ["*.nix"];};
          statix = {
              command = "statix-fix";
              includes = ["*.nix"];
            };
          stylua = {command = "stylua"; includes = ["*.lua"];};
          deadnix = {
              command = "deadnix";
              includes = ["*.nix"];
              options = ["--edit"];
            };
          nixfmt = {
              command = "nixfmt";
              includes = ["*.nix"];
            };
        };
      };
  };
  lefthook = (mkNixago configs.lefthook) {
    data = {
      # commit-msg.commands.conform.run ="${nixpkgs.conform}/bin/conform enforce ==commit-msg-file {1}";
      pre-commit.commands = {
        treefmt.run = "${pkgs.treefmt}/bin/treefmt {staged_files}";
        # trufflehog.run = ''
        #   set -e
        #   ${nixpkgs.trufflehog}/bin/trufflehog git git " "file://$" (
        #     git rev-parse - -show-toplevel
        #   ) " --since-commit HEAD --only-verified --fail"'';
      };
    };
  };

  luarc-nightly = mkNixago {
    output = ".luarc.json";
    format = "json";
    data = luarc-nightly;
  };
}
