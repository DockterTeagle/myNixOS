{ pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./solaar.nix
    ./wayland
    ./terminal
    ./stylix.nix
  ];
  home.packages = with pkgs;[
    # valeStyles.write-good
  ];
}
