{ pkgs, ... }:
{
  #NOTE: NONE OF ME ARE MODULES --check date 08/22/25
  home.packages = with pkgs; [
    dust
  ];
  imports = [
    ./yazi.nix
  ];
}
