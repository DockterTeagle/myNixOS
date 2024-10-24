{pkgs, ...}: {
  imports = [
    ./bootloader
    ./shell
    ./zram
  ];
  # environment.systemPackages = with pkgs;[ libnotify ];
}
