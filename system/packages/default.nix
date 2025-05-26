{pkgs, ...}: {
  imports = [
    ./per-system
  ];
  environment.systemPackages = with pkgs; [
    libnotify
    visidata
    vulnix
    obsidian
  ];
}
