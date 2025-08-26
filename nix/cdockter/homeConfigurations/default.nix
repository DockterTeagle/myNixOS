{ inputs, cell }:
let
  inherit (inputs) nixpkgs;
  lib = nixpkgs.lib // builtins;
  inherit (inputs) cells;
in
{ }
