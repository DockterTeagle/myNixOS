{ inputs, cell }:

let
  inherit (inputs.nixpkgs) lib;
  inherit (cell) nixosProfiles;
in
{

  default = [
    # nixosProfiles.boot
    nixosProfiles.gaming
    nixosProfiles.nix
    nixosProfiles.network
    nixosProfiles.hyprland
    nixosProfiles.security
    nixosProfiles.services
    nixosProfiles.sops
    nixosProfiles.system
    nixosProfiles.wayland
    # nixosProfiles.stylix
  ];
}
