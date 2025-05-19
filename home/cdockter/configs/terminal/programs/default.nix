{
  programs.nix-index.enable = true;
  imports = [
    ./systemmonitors
    ./aesthetics
    ./finders
    ./filemanagers
    ./gitShit
    ./tmuxAndFriends
    ./neovim.nix
    ./topgrade.nix
  ];
}
