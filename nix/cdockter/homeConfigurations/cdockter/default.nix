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
  imports = suites++[cell.bee] ;
}
