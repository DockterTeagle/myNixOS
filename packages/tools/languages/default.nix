{ pkgs, ... }:
{
  imports = [
    ./lua.nix
    ./python.nix
    ./CLanguage.nix
    # ./rust.nix
  ];
  environment.systemPackages = with pkgs;[
    gnumake
    bun
  ];
}
