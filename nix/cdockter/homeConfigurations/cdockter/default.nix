{
  inputs,
  cell,
  lib,
}:
let
  inherit (cell) homeSuites bee;
in
{
  inherit bee;
  imports =
    let
      suites =
        with homeSuites;
        lib.concatLists [
          VCS
          homeSet
          randomBullshit
        ];
    in
    lib.concatLists [
      suites
    ];

}
