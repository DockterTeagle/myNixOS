{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zotero
    mprocs # run processes in parallel
    uutils-coreutils-noprefix
  ];
  programs = {
    nix-index.enable = true;
    bluetuith.enable = true;
    pay-respects = {
      enable = true;
    };
  };
  imports = [
    ./systemmonitors
    ./aesthetics
    ./finders
    ./filemanagers
    ./git
    ./tmuxAndFriends
    ./nvim
    ./nix
    ./topgrade.nix
    ./translate-shell.nix
  ];
}
