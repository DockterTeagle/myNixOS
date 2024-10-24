{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libgtop
    bluez
    bluez-tools
    grimblast
    gpu-screen-recorder
    btop
    matugen
    wl-clipboard
    swww
    dart-sass
    brightnessctl
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
