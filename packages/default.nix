{ inputs, systemSettings, pkgs, lib, config, ... }:
{
  imports = [
    ./GUI
    ./environments
    ./hardware
    ./network #This module is scary
    ./security
    ./system
    ./tools
    ./gaming.nix
  ];
  environment.systemPackages = with pkgs; [
    woeusb
    libnotify
    qmk
  ];
}
