{
  inputs,
  cell,
}:
let
  inherit (inputs.std.data) configs;
  inherit (inputs.std.lib.dev) mkNixago;
  inherit (cell.nvimPlugins) plugins;
  pkgs = inputs.nixpkgs;
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
      commit-msg.commands.conform.run = "${pkgs.conform}/bin/conform enforce ";
      pre-commit.commands = {
        # treefmt.run = "${cell.treefmtConfigs.default}";
        # trufflehog.run = ''
        #   set -e
        #   ${pkgs.trufflehog}/bin/trufflehog git git " "file://$" (
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
    output = ".emmyrc.json";
    format = "json";
    data = {
      runtime = {
        version = "LuaJIT";
        library = plugins ++ [
          "${cell.toolchain.neovim.neovim-nightly}/share/nvim/runtime/lua"
        ];
      };
    };
  };
  treefmt = (mkNixago inputs.std.lib.cfg.treefmt) {
    data = {
      tree-root-file = "flake.nix";
      formatter = {
        taplo = {
          command = "taplo";
          options = [ "format" ];
          includes = [ "*.toml" ];
        };
        nixf-diagnose = {
          command = "nixf-diagnose";
          includes = [ "*.nix" ];
        };
        mdformat = {
          command = "mdformat";
          includes = [ "*.md" ];
        };
        stylua = {
          command = "stylua";
          includes = [ "*.lua" ];
        };
        deadnix = {
          command = "deadnix";
          # options = [ "--edit" ];
          includes = [ "*.nix" ];
        };
        nixfmt = {
          command = "nixfmt";
          includes = [ "*.nix" ];
        };
      };
    };

    packages = with pkgs; [
      nixfmt
      stylua
      deadnix
      statix
      nixf-diagnose
      taplo
      mdformat
    ];
  };
}
