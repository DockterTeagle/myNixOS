{pkgs, ...}: {
  home.packages = with pkgs; [
    dua
    dust
  ];
  imports = [
    ./yazi.nix
  ];
}
