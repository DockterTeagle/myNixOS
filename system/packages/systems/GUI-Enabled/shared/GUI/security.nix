{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    protonvpn-gui
    element-desktop
  ];
}
