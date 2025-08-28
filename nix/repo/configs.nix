{
  inputs,
  cell,
}:
let
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
  lefthook = (mkNixago configs.lefthook) {
    data = {
      commit-msg.commands.conform.run = "${inputs.nixpkgs.conform}/bin/conform enforce ";
      pre-commit.commands = {
        # treefmt.run = "${cell.treefmtConfigs.default}/bin/treefmt {staged_files}";
        # trufflehog.run = ''
        #   set -e
        #   ${nixpkgs.trufflehog}/bin/trufflehog git git " "file://$" (
        #     git rev-parse - -show-toplevel
        #   ) " --since-commit HEAD --only-verified --fail"'';
      };
    };
  };

  conform = (mkNixago inputs.std.lib.cfg.conform) {
    # The configuration of Conform is a bit different than the expected file
    # format. This is to prevent excessive nested attribute sets. In this case,
    # we only need to specify either a `commit` or `license` parent attribute
    # and then the child contents match what is specified in the Conform README.
    data = {
      commit = {
        header = {
          length = 89;
        };
        conventional = {
          # Only allow these types of conventional commits (inspired by Angular)
          types = [
            "build"
            "chore"
            "ci"
            "docs"
            "feat"
            "fix"
            "perf"
            "refactor"
            "style"
            "test"
          ];
        };
      };
    };
  };
  luarc-nightly = mkNixago {
    output = ".luarc.json";
    format = "json";
    data = luarc-nightly;
  };
}
