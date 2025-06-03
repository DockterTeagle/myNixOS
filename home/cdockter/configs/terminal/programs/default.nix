{pkgs, ...}: {
  home.packages = with pkgs; [
    mprocs #run proccesses in parallel
    cargo-info
    rusty-man
    tokei #code counter
    wiki-tui
    just
    presenterm
    uutils-coreutils-noprefix
    kanata-with-cmd
  ];
  programs.nix-index.enable = true;
  imports = [
    ./thefuck.nix
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
