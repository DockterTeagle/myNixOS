{
  pkgs,
  config,
  ...
}:
{
  nix = {
    package = pkgs.nixVersions.latest;
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
