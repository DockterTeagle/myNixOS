
{pkgs,config,inputs, ...}:
{
  home.packages = with pkgs; [
    zsh
    eza
    oh-my-zsh
    zsh-syntax-highlighting
    zsh-powerlevel10k
  ];
}
