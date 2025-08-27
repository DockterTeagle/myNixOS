{
  inputs,
  pkgs,
  cell,
}:
{
  home.packages = with pkgs; [
    mprocs # run processes in parallel
    uutils-coreutils-noprefix
    dust
  ];
}
