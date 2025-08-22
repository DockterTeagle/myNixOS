{ pkgs, ... }:
{
  #NOTE: NONE OF ME ARE MODULES --check date 08/22/25
  home.packages = with pkgs; [
    mprocs # run processes in parallel
    uutils-coreutils-noprefix
  ];
  programs.nix-index.enable = true;
  programs.pay-respects = {
    enable = true;
    options = [
      "--alias"
      "tf"
    ];
  };
  imports = [
    ./systemmonitors
    ./aesthetics
    ./finders
    ./filemanagers
    ./gitShit
    ./tmuxAndFriends
    ./nvim
    ./nix.nix
    ./topgrade.nix
    ./zathura.nix
    ./feh.nix
  ];
}
