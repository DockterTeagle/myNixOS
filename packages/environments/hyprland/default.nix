{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libgtop
    grimblast
    gpu-screen-recorder
    btop
    matugen
    wl-clipboard
    swww
    dart-sass
    gnome-bluetooth
    python313Packages.gpustat
    hyprcursor
    hyprpaper
    hyprpicker
    hypridle
    hyprlock
    wf-recorder
    hyprshot
  ];
}
