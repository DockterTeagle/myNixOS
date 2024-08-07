{ pkgs, ... }:
{
  services.solaar.enable = true;
  environment.systemPackages = with pkgs;[
    element-desktop-wayland
    libreoffice
    thunderbird
  ];
}
