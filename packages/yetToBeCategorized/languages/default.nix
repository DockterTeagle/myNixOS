{ pkgs, ... }:
{
  imports = [
    ./lua.nix
    ./rust.nix
    ./python.nix
    ./CLanguage.nix
  ];
  environment.systemPackages = with pkgs;[
    deno
  ];
}
