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
    nix/cdockter/homeProfiles/cliphist|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/cliphist/
    nix/cdockter/homeProfiles/fuzzel|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/fuzzel/
    nix/cdockter/homeProfiles/hypr|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/hypr/
    nix/cdockter/homeProfiles/mangohud|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/mangohud/
    nix/cdockter/homeProfiles/ncspot|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/ncspot/
    nix/cdockter/homeProfiles/nh|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/nh/
    nix/cdockter/homeProfiles/nix|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/nix/
    nix/cdockter/homeProfiles/nushell|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/nushell/
    nix/cdockter/homeProfiles/nvim|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/nvim/
    nix/cdockter/homeProfiles/obsidian|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/obsidian/
    nix/cdockter/homeProfiles/pay-respects|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/pay-respects/
    nix/cdockter/homeProfiles/ripgrep|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/ripgrep/
    nix/cdockter/homeProfiles/sesh|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/sesh/
    nix/cdockter/homeProfiles/sops|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/sops/
    nix/cdockter/homeProfiles/spotifyd|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/spotifyd/
    nix/cdockter/homeProfiles/stylix|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/stylix/
    nix/cdockter/homeProfiles/tmux|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/tmux/
    nix/cdockter/homeProfiles/vars|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/vars/
    nix/cdockter/homeProfiles/yazi|1 col 1| /home/cdockter/Documents/myNixOS/nix/cdockter/homeProfiles/yazi/
  */
}
