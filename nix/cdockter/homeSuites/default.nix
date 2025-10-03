{
  inputs,
  cell,
}:
let
  inherit (cell) homeProfiles;
in
rec {
  uncategorized = [ cell.homeProfiles.packages ];
  tmuxAndFriends = with homeProfiles; [
    tmux
    sesh
  ];
  VCS = with homeProfiles; [
    git
    git-sync
    lazygit
    jujutsu
    gh-cli
  ];
  music = with homeProfiles; [
    ncspot
    spotifyd
  ];
  secrets = with homeProfiles; [
    gpg
    ssh
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
    ripgrep
    pay-respects
    bat
    btop
    fd
    fzf
    direnv
    zoxide
    nh
  ];
  shell = with homeProfiles; [
    fish
    starship
    carapace
    nix # TODO: SORT ME BETTER
    yazi
    zathura
  ];
  hyprEcosystem = with homeProfiles; [
    hypridle
    hyprland
    hyprlock
    hyprpolkitagent
    hyprsunset
  ];
  hyprExtensions = with homeProfiles; [
    hyprshell
    hyprpanel
  ];
  editor = with homeProfiles; [
    nvim
  ];
  visuals = [
    # cell.homeProfiles.stylix
  ];
  GUI = with homeProfiles; [
    browsers
    vesktop
    mangohud
    obsidian
    element
  ];
  services = with homeProfiles; [
    playerctld
    cliphist
    fuzzel
  ];
  All = inputs.nixpkgs.lib.concatLists [
    GUI
    shell
    betterTerminal
    emus
    homeSet
    secrets
    VCS
    tmuxAndFriends
    uncategorized
    music
    hyprEcosystem
    hyprExtensions
    editor
    services
    visuals
  ];
}
