{ pkgs, ... }:
let
  systemSettings = {

  };
  homeConfig = import ./home { inherit pkgs; };
  inherit (homeConfig) cdockterSettings;
in
{
  inherit cdockterSettings systemSettings;
}
