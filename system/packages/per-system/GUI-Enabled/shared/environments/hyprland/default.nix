{
  pkgs,
  inputs,
  ...
}: {
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
