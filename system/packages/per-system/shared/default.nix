{pkgs, ...}: {
  imports = [
    ./terminal
    ./clipboard.nix
    ./stylix.nix
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
