{ pkgs, ... }:
{
  security.polkit.enable = true;
  environment.systemPackages = with pkgs;[
    swayidle
    swaylock
  ];
}
