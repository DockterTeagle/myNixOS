
{pkgs,config,inputs, ...}:
{
  home.packages = with pkgs; [
    zsh
    eza
  ];
}
