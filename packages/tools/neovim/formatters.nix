{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    bibtex-tidy
    nixpkgs-fmt
    cmake-format
  ];
}
