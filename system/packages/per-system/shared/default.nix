{pkgs, ...}: {
  imports = [
    ./terminal
    ./clipboard.nix
    ./stylix.nix
  ];
  environment.systemPackages = with pkgs; [
    woeusb
    libnotify
    github-cli
    # rar
    # unrar
  ];
}
