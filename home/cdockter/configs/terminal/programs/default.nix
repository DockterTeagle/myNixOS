{pkgs, ...}: {
  home.packages = with pkgs; [
    mprocs #run proccesses in parallel
    cargo-info
    rusty-man
    wiki-tui
    just
    presenterm
    uutils-coreutils-noprefix
    kanata-with-cmd
  ];
  programs.nix-index.enable = true;
  programs.pay-respects = {
    enable = true;
    options = ["--alias" "tf"];
  };
  imports = [
    ./systemmonitors
    ./aesthetics
    ./finders
    ./filemanagers
    ./gitShit
    ./tmuxAndFriends
    ./neovim.nix
    ./nix.nix
    ./topgrade.nix
  ];
}
