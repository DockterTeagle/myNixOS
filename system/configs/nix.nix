{ pkgs, ... }:
{
  nix = {
    package = pkgs.lixPackageSets.git.lix;
    channel.enable = false;
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
      substituters = [
        "https://ghostty.cachix.org"
        "https://cache.nixos.org"
        "https://hyprland.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://yazi.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
        "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
      ];
      auto-optimise-store = true;
    };
  };
}
