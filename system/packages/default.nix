{pkgs, ...}: {
  imports = [
    ./per-system
  ];
  environment.systemPackages = with pkgs; [
    woeusb
    libnotify
    visidata
    github-cli
    vulnix
    # rar
    # unrar
  ];
}
