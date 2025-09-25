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
  imports =
    let
      profiles = [
        userProfiles.cdockter
        hardwareProfiles."${hostname}"
        cell.bee
      ];
      suites = lib.concatLists [ nixosSuites.default ];
    in
    lib.concatLists [
      profiles
      suites
    ];
}
