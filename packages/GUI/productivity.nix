{ pkgs, ... }:
{
  programs.solaar.enable = true;
  environment.systemPackages = with pkgs;[
    element-desktop-wayland
    libreoffice
    thunderbird
    zoom-us
    obs-studio
  ];
}
