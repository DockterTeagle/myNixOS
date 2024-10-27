{
  pkgs,
  inputs,
  systemSettings,
  ...
}: {
  environment.systemPackages = with pkgs; [
    bibtex-tidy
    codespell
    nixfmt-rfc-style
    cmake-format
    treefmt2
    inputs.alejandra.defaultPackage.${systemSettings.system}
  ];
}
