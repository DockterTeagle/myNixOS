{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    stylua
    alejandra
    selene
    bibtex-tidy
    nixpkgs-fmt
    ripgrep
    python312Packages.black
    cmake-format
  ];
}
