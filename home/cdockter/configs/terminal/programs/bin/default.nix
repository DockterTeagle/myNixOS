{
  programs.nix-index.enable = true;
  imports = [
    ./neovim.nix
    ./carapace.nix
    ./thefuck.nix
    ./topgrade.nix
    ./aesthetics
    ./finders
    ./gitShit
    ./tmuxAndFriends
  ];
}
