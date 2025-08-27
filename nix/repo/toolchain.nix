{
  inputs,
  cell,
}:
let
  inherit (inputs) nixpkgs;
  pkgs = nixpkgs;
in
{
  neovim = inputs.nixpkgs.extend inputs.neorocks.overlays.default;
  gen-luarc = inputs.nixpkgs.extend inputs.gen-luarc.overlays.default;
}
