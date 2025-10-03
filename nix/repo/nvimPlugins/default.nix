{
  inputs,
  cell,
}:
let
  load = file: import file { inherit inputs cell; };
  plugins = builtins.concatLists (
    map load [
      ./gitPlugins.nix
      ./neotestPlugins.nix
    ]
  );
in
{
  inherit plugins;
}
