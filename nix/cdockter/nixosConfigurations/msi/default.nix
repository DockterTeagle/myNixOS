{
  inputs,
  cell,
  lib,
}:
let
  inherit (cell)
    bee
    hardwareProfiles
    nixosProfiles
    nixosSuites
    ;
  inherit (inputs) nixpkgs;
  hostname = "msi";
in
{
  inherit bee;
  imports =
    let
      profiles = with nixosProfiles; [
      ];
      suites = with nixosSuites; laptop;
    in
    lib.concatLists [
      [
        cell.bee
        hardwareProfiles."${hostname}"
      ]
      profiles
      suites
    ];
}
