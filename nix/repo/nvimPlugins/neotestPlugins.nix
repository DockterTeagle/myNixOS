{ inputs, cell }:
let
  pkgs = inputs.nixpkgs;

  plugins = with pkgs.vimPlugins; [
    neotest
    neotest-python
    neotest-zig
  ];
in
plugins
