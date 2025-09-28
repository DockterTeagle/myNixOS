{
  pkgs,
}:
{
  home.packages = with pkgs; [
    mprocs # run processes in parallel
    uutils-coreutils-noprefix
    nix-tree
    dust
  ];
}
