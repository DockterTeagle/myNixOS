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
    # rocmPackages_6.llvm.clang-unwrapped includes clang-format
  ];
}
