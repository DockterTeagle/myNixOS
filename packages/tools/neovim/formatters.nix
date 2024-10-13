{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    stylua
    bibtex-tidy
    nixpkgs-fmt
    python312Packages.black
    cmake-format
  ];
}
