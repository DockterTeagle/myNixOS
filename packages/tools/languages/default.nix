{ pkgs, ... }:
{
  imports = [
    ./lua.nix
    ./python.nix
    ./CLanguage.nix
  ];
  environment.systemPackages = with pkgs;[
    gnumake
  ];
}
