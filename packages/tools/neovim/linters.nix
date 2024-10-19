{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    selene
    ruff
    vale
    # valeStyles.write-good
  ];
}
