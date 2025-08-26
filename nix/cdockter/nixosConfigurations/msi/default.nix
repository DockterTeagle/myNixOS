{
  inputs,
  cell,
  lib,
}:
let
  inherit (cell) bee hardwareProfiles nixosProfiles;
  inherit (inputs) nixpkgs;
  hostname = "msi";
in
{
  inherit bee;
  imports =
    let
      profiles = with nixosProfiles; [
        # ./common
        # hardwareProfiles
      ];
    in
    lib.concatLists [ [ ] ];
}
