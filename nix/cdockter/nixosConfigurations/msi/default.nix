{
  inputs,
  cell,
  lib,
}:
let
  inherit (cell)
    # nixosProfiles
    hardwareProfiles
    nixosSuites
    userProfiles
    ;
  hostname = "msi";
in
{
  inherit (cell) bee;
  imports =
    let
      profiles = [
        userProfiles.cdockter
        hardwareProfiles."${hostname}"
      ];
      suites = lib.concatLists [ nixosSuites.default ];
    in
    lib.concatLists [
      profiles
      suites
    ];
}
