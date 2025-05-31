{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libnotify
    visidata
    vulnix
    obsidian
  ];
}
