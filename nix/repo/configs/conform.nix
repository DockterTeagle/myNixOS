{ inputs, cell }:
let

  inherit (inputs.std.lib.dev) mkNixago;
in
{
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
}
