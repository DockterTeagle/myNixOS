{pkgs, ...}: {
  imports = [
    ./per-system
  ];
  environment.systemPackages = with pkgs; [
    woeusb
    libnotify
    qmk
    nix-index
    github-cli
    # rar
    # unrar
  ];
}
