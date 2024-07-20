{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    # cpplint #FIXME: currently has a bug where it is misspeled even tho this is not found on the gh
    python312Packages.mypy
    ruff
    vale
  ];
}
