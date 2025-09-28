{
  inputs,
  cell,
}:
let
  load = file: import file { inherit inputs cell; };
  plugins = builtins.concatLists (
    map load [
      ./gitPlugins.nix
    ]
  );
in
{
  inherit plugins;
}
