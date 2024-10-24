{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bibtex-tidy
    codespell
    nixfmt-rfc-style
    alejandra
    cmake-format
  ];
}
