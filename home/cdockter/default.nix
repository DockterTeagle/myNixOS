{
  pkgs,
  ...
}:
{
  #TODO: move this whole file into configs
  imports = [
    ./configs
    ./secrets
  ];
  programs = {
    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
        package = pkgs.lixPackageSets.git.nix-direnv;
      };
    };
    home-manager.enable = true;
  };
}
