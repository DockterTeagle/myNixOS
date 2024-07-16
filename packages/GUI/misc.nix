{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[

    firefox
    protonvpn-gui
  ];
}
