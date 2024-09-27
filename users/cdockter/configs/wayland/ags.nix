{ inputs, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    enable = true;
    # configDir = ./ags/DreamsOfCodeConfig;
    extraPackages = with pkgs;[
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };
}

