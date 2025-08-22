{
  inputs = {
    nixpkgsdev.url = "github:nixos/nixpkgs/nixos-unstable";
    devenv.url = "github:cachix/devenv";
    nixd.url = "github:nix-community/nixd";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
  outputs = inputs: { };
}
