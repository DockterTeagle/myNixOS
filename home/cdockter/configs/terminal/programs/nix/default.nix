{
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./direnv.nix
    ./home-manager.nix
    ./nh.nix
  ];
  nix = {
    package = pkgs.lixPackageSets.git.lix;
    extraOptions = ''
      !include ${config.sops.secrets."nixAccessTokens".path}
    '';
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
