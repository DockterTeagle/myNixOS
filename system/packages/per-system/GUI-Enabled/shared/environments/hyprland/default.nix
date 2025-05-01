{
  pkgs,
  inputs,
  systemSettings,
  ...
}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${systemSettings.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${systemSettings.system}.xdg-desktop-portal-hyprland;
  };
  environment.systemPackages = with pkgs; [
    gpu-screen-recorder
    wl-clipboard
    wl-clipboard-x11
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    hyprpicker
    hyprsunset
    hyprpolkitagent # needed?
    hyprsysteminfo
    # wf-recorder
  ];
}
