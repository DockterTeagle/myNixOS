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
  environment.systemPackages = [
    inputs.agenix.packages."${systemSettings.system}".default
    pkgs.woeusb
  ];
}
