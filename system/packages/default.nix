{pkgs, ...}: {
  imports = [
    ./per-system
  ];
  environment.systemPackages = with pkgs; [
    woeusb
    libnotify
    nix-index
    github-cli
    # rar
    # unrar
  ];
}
