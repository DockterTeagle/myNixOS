{
  inputs,
  cell,
  lib,
}:
let
  inherit (cell) homeSuites bee;
  suites = with homeSuites; lib.concatLists [ All ];
in
{
  inherit bee;
  imports = suites ++ [ inputs.stylix.homeModules.stylix ];

}
