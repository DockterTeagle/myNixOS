{ pkgs, ... }:
{
  imports = [
    ./neovim
    ./languages
  ];
  environment.systemPackages = with pkgs; [
    xdotool
    pstree
  ];
}
