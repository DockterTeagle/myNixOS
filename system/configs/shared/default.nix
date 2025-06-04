{pkgs, ...}: {
  imports = [
    ./terminal
    ./stylix.nix
    ./nix.nix
  ];
  environment.systemPackages = with pkgs; [
    libnotify
    # rar
    # unrar
  ];
}
