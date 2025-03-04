{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gpu-screen-recorder
    wl-clipboard
    wl-clipboard-x11
    grimblast
    slurp
    dart-sass
    hyprpicker
    hyprsunset
    hyprpolkitagent
    hyprsysteminfo
    # wf-recorder
  ];
}
