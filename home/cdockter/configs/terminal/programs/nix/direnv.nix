{

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
      # package = pkgs.lixPackageSets.git.nix-direnv;
    };
  };
}
