{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gpu-screen-recorder
    wl-clipboard
    wl-clipboard-x11
    swww
    dart-sass
    gnome-bluetooth
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
