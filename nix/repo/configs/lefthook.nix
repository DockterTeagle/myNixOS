{ inputs, cell }:
let
  inherit (inputs.std.data) configs;
  inherit (inputs.std.lib.dev) mkNixago;
  pkgs = inputs.nixpkgs;
in
{
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
}
