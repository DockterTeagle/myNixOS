{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    xdotool
    ctags
    sqlite
  ];
}
