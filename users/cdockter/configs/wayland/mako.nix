#TODO: Rice me I am the notification manager
{ pkgs, ... }:
{
  services.mako = {
    package = pkgs.mako;
    enable = true;
    actions = true;
    anchor = "top-right";
    defaultTimeout = 2000;
    # borderColor = ;
  };
}
