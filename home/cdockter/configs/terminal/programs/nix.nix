{
  pkgs,
  config,
  ...
}: {
  nix = {
    package = pkgs.lixPackageSets.latest.lix;
    extraOptions = ''
      !include ${config.sops.secrets."nixAccessTokens".path}
    '';
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "no-url-literals"
      ];
    };
  };
}
