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
  # TODO: move all of me
  environment.systemPackages = with pkgs; [
    gpu-screen-recorder
    wl-clipboard
    wl-clipboard-x11
    grimblast
    hyprpicker
    hyprsunset
  ];
}
