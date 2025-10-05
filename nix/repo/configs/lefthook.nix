{ inputs, cell }:
let
  inherit (inputs.std.data) configs;
  inherit (inputs.std.lib.dev) mkNixago;
  pkgs = inputs.nixpkgs;
in
{
  lefthook = (mkNixago configs.lefthook) {
    data = {
      lint = {
        parallel = true;
      };
      commit-msg.commands.conform.run = "${pkgs.conform}/bin/conform enforce ";
      pre-commit = {
        commands = {
          # treefmt.run = "${cell.treefmtConfigs.default}";

          parallel = true;
        };
      };
    };
  };
}
