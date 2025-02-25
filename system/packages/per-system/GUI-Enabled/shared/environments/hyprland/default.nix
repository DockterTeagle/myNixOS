{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gpu-screen-recorder
    wl-clipboard
    wl-clipboard-x11
    dart-sass
    gnome-bluetooth
    hyprcursor
    hyprpicker
    hyprshot
    hyprsunset
    hyprpolkitagent
    hyprsysteminfo
    # wf-recorder
  ];
}
