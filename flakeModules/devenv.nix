{
  inputs',
  pkgs,
  config,
  ...
}: let
  inherit (config) treefmt;
in {
  devenv.shells.default = {
    cachix = {
      enable = true;
      pull = ["pre-commit-hooks"];
    };
    packages = with pkgs; [
      # lsps
      inputs'.nixd.packages.nixd
      marksman
      ltex-ls-plus
      #formatters
      alejandra
      #linters
      codespell
      dprint
      #etc
      nix-melt
    ];
    git-hooks = {
      enabledPackages = with pkgs; [
        flake-checker
        gitleaks
        trufflehog
        statix
      ];
      hooks = {
        # markdown
        markdownlint.enable = true;
        mdsh.enable = true;
        #nix
        statix.enable = true;
        flake-checker.enable = true;
        deadnix.enable = true;
        #secrets
        gitleaks = {
          name = "gitleaks";
          enable = true;
          entry = "gitleaks dir";
        };
        # trufflehog={
        #     enable = true;
        #       entry = ''trufflehog git "file://$(git rev-parse --show-top-level)" --since-commit HEAD --only-verified --fail'';
        #     };
        detect-private-keys.enable = true;
        #etc
        #git
        # annex.enable = true;
        check-merge-conflicts.enable = true;
        commitizen.enable = true;

        convco.enable = true;
        forbid-new-submodules.enable = true;
        treefmt = {
          package = treefmt.build.wrapper;
          enable = true;
        };
      };
    };
  };
}
