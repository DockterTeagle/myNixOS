{ inputs, ... }:
let
  systemConfig = import ./system { inherit inputs; };
  inherit (systemConfig) pkgs systemSettings;
  homeConfig = import ./home { inherit pkgs; };
  inherit (homeConfig) cdockterSettings;
in
{
  inherit pkgs systemSettings cdockterSettings;
}
