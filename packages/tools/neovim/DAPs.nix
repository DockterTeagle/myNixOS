{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    #DAPS
    python312Packages.debugpy
    fd
    bibtex-tidy
  ];
}
