{ pkgs, inputs, ... }:
{
  imports = [
    ./kitty.nix
    ./tmux.nix
    ./zsh.nix
  ];
}
