{ pkgs, ... }:
let
  nixpkgs = import ./inputs/nixpkgs.nix;
  neovim = import ./inputs/neovim.nix;
  hyprland = import ./inputs/hyprland.nix;
  utils = import ./inputs/utils.nix;
  lib = pkgs.lib;
in

(lib.attrsets.recursiveUpdate nixpkgs neovim)
