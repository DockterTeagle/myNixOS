{
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  nixpkgs-mozilla.url = "github:mozilla/nixpkgs-mozilla";
  nixpkgs-wayland = {
    inputs.nixpkgs.follows = "nixpkgs";
    url = "github:nix-community/nixpkgs-wayland";
  };
  nixos-hardware.url = "github:NixOS/nixos-hardware/master";
}
