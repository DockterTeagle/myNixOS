{pkgs, ...}: {
  imports = [
    ./per-system
  ];
  environment.systemPackages = with pkgs; [
    woeusb
    libnotify
    nix-index
    visidata
    github-cli
    vulnix
    # rar
    # unrar
  ];
}
