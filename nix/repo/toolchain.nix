{
  inputs,
  cell,
}:
{
  neovim = inputs.nixpkgs.extend inputs.neorocks.overlays.default;
}
