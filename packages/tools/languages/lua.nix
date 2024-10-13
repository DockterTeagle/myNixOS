{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    lua5_4
    luajitPackages.luarocks_bootstrap
    luajit
  ];
}
