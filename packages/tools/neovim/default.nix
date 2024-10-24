{pkgs, ...}: {
  imports = [
    ./DAPs.nix
    ./LSPs.nix
    ./linters.nix
    ./formatters.nix
  ];
  environment.systemPackages = with pkgs; [
    xdotool
    ripgrep
    fd
  ];
}
