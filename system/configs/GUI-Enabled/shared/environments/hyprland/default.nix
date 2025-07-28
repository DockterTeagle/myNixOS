{
  pkgs,
  inputs',
  ...
}:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs'.hyprland.packages.hyprland;
    portalPackage = inputs'.hyprland.packages.xdg-desktop-portal-hyprland;
  };
  # TODO: move all of me
  environment.systemPackages = with pkgs; [
    grimblast
    wl-clipboard
  ];
}
