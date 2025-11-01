{ pkgs, ... }:
{
  nix = {
    package = pkgs.lixPackageSets.git.lix;
    channel.enable = false;
    settings = {
      experimental-features = [
        "auto-allocate-uids"
        "lix-custom-sub-commands"
        "nix-command"
        "flakes"
        "cgroups"
        "pipe-operator"
      ];
      substituters = [
        "https://cache.nixos.org"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
      auto-optimise-store = true;
    };
  };
}
