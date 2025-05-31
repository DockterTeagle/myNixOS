{pkgs, ...}: {
  imports = [
    ./terminal
    ./stylix.nix
    ./nix.nix
  ];
  environment.systemPackages = with pkgs; [
    woeusb
    libnotify
    github-cli
    # rar
    # unrar
  ];
}
