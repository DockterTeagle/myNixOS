{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zulu17
  ];
}
