{ inputs, ... }:
{
  imports = [
    inputs.git-hooks-nix.flakeModule
  ];
  systems = [
    "x86_64-linux"
    "aarch64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];
  perSystem =
    { config, ... }:
    {
      pre-commit.settings = {
        hooks = {
          pre-commit-hook-ensure-sops.enable = true;
          trufflehog.enable = true;
          treefmt = {
            enable = true;
            package = config.treefmt.build.wrapper;
          };
          convco.enable = true;
        };
      };
    };
}
