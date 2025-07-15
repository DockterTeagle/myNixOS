{
  pkgs,
  config,
  ...
}:
{
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
