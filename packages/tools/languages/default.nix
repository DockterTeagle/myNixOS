{ pkgs, ... }:
{
  imports = [
    ./lua.nix
    ./python.nix
  ];
  environment.systemPackages = with pkgs;[
    gnumake
  ];
}
