{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sops
    age
  ];
  imports = [
    ./stylix.nix
    ./nix.nix
    ./shared
    ./MSI-GE75Raider
  ];
  fonts.fontconfig.enable = true;
}
