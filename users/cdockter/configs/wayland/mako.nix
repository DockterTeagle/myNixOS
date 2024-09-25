{ pkgs, ... }:
{
  services.mako = {
    package = pkgs.mako;
    enable = true;
    actions = true;
    anchor = "top-right";
    defaultTimeout = 2000;
  };
}
