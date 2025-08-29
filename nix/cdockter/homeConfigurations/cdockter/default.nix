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
          All
          # VCS
          # homeSet
          # packages
        ];
    in
    lib.concatLists [
      suites
      # [ inputs.stylix.homeModules.stylix ]
    ];

}
