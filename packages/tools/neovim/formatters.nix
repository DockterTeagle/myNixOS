{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bibtex-tidy
    codespell
    nixfmt-rfc-style
    cmake-format
    treefmt2
  ];
}
