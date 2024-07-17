{ conf, pkgs, lib, ... }:
let
  inherit (conf) mainUserSettings systemSettings;
  inherit (lib) optional;
in
{
  imports =
    [
      (import ./ssh/default.nix { inherit mainUserSettings lib systemSettings; })
    ]
    ++ optional (conf.wireless) (import ./wireless/default.nix { inherit pkgs systemSettings; });
}
