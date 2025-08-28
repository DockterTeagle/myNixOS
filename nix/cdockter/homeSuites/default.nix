{
  inputs,
  cell,
}:
let
  inherit (cell) homeProfiles;
in
{
  randomBullshit = with homeProfiles; [ packages ];
  tmuxAndFriends = with homeProfiles; [
    tmux
    sesh
  ];
  VCS = with homeProfiles; [
    git
    git-sync
    lazygit
    jujutsu
    gh
  ];
  secrets = with homeProfiles; [
    age
    gpg
    sops
  ];
  homeSet = with homeProfiles; [
    vars
    home-manager
    xdg
  ];
  emus = with homeProfiles; [
    ghostty
  ];

  betterTerminal = with homeProfiles; [
    eza
    bat
    btop
    fd
    fzf
    direnv
    zoxide
  ];
  shell = with homeProfiles; [
    fish
    starship
    carapace
  ];
  GUI = with homeProfiles; [
    browser
    veskstop
    obsidian
    element
  ];
  /**
    nix/cdockter/homeProfiles/tmux|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/tmux/
    nix/cdockter/homeProfiles/vars|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/vars/
    nix/cdockter/homeProfiles/yazi|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/yazi/
  */
}
