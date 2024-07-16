{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    lua
    luajitPackages.luarocks_bootstrap
    luajit
  ];
}
