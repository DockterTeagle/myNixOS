{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    stylua
    bibtex-tidy
    nixpkgs-fmt
    cmake-format
  ];
}
