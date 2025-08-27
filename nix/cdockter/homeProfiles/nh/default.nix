{ inputs, pkgs, ... }:
{
  programs.nh = {
    enable = true;
    package = inputs.nh.packages.${pkgs.system}.default;
    clean = {
      enable = true;
    };
  };
}
