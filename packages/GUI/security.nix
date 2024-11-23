{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    protonvpn-gui
    proton-pass
    element-desktop
  ];
}
