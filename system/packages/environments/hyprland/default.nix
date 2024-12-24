{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libgtop
    grimblast
    gpu-screen-recorder
    btop
    # matugen
    wl-clipboard
    wl-clipboard-x11
    swww
    dart-sass
    gnome-bluetooth
    # python313Packages.gpustat
    hyprcursor
    hyprpaper
    hyprpicker
    hypridle
    hyprlock
    hyprshot
    hyprsunset
    # wf-recorder
  ];
}
