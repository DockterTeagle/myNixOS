{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zsh
    eza
    oh-my-zsh
    zsh-syntax-highlighting
    fzf
  ];
}
