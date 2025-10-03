{
  cell,
  inputs,
}:
let
  inherit (cell) nixosProfiles;
in
{
  default = [
    nixosProfiles.gaming
    nixosProfiles.nix
    nixosProfiles.network
    nixosProfiles.systemMonitors
    nixosProfiles.hyprland
    nixosProfiles.security
    nixosProfiles.services
    nixosProfiles.sops
    nixosProfiles.system
    nixosProfiles.wayland
    # nixosProfiles.stylix
  ];
}
