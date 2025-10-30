{ inputs, pkgs, ... }:
{
  programs.nh = {
    enable = true;
    package = inputs.nh.packages.${pkgs.stdenv.hostPlatform.system}.default;
    clean = {
      enable = true;
    };
  };
}
