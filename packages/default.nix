{
  inputs,
  systemSettings,
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./GUI
    ./environments
    ./hardware
    ./network # This module is scary
    ./security
    ./system
    ./tools
    ./gaming.nix
    ./stylix.nix
  ];
  environment.systemPackages = with pkgs; [
    woeusb
    libnotify
    matlab
    qmk
    nix-index
  ];
}
