{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sops
    age
  ];
  imports = [
    ./terminal
    ./stylix.nix
    ./nix.nix
    ./GUI-Enabled
  ];
}
