{pkgs, ...}: {
  imports = [
    ./terminal
    ./clipboard.nix
    ./stylix.nix
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
