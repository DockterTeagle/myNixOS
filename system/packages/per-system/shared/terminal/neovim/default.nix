{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xdotool
    ripgrep
    ctags
  ];
}
