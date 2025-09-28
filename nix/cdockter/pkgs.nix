{
  inputs,
  cell,
}:
import inputs.nixpkgs {
  inherit (inputs.nixpkgs) system;
  inherit (cell.overlays) overlays;
  config = cell.nixpkgsConfig;
}
