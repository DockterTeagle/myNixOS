{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dust
  ];
  imports = [
    ./yazi.nix
  ];
}
