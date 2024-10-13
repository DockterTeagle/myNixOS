{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    selene
    python312Packages.mypy
    ruff
    vale
  ];
}
