{ pkgs, ... }:
{
  imports = [
    ./fish.nix
    ./zsh-and-plugins.nix
  ];
  environment.systemPackages = with pkgs;[
    foot
  ];
}
