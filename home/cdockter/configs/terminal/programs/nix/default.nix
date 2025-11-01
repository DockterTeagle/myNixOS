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
        "auto-allocate-uids"
        "lix-custom-sub-commands"
        # "parse-toml-timestamps"
        "nix-command"
        "flakes"
        "fetch-closure"
        "cgroups"
        # "ca-derivations"
        "pipe-operator"
      ];
    };
  };
}
