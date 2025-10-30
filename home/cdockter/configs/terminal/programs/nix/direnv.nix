{ pkgs, ... }:
{

  programs = {
    nix-your-shell = {
      enable = true;
      nix-output-monitor.enable = true;
    };
    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
        package = pkgs.lixPackageSets.git.nix-direnv;
      };
    };
  };
}
