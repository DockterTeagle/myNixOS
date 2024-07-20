{ pkgs, ... }:
{
  imports = [
    ./neovim
  ];
  environment.systemPackages = with pkgs; [
    xdotool
    pstree
    #Linters
  ];
}
