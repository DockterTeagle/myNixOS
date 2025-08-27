{
  pkgs,
  inputs,
  ...
}:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
  #NOTE: NONE OF ME ARE MODULES --check date 08/22/25
  environment.systemPackages = with pkgs; [
    grimblast
    wl-clipboard
  ];
}
