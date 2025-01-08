{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # selene
    # vale
    # write-good
    # statix
  ];
}
