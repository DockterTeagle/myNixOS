{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    python312Packages.debugpy
    bibtex-tidy
  ];
}
