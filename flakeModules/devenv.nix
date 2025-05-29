{
  inputs',
  pkgs,
  config,
  ...
}: {
  devenv.shells.default = {
    cachix = {
      enable = true;
      pull = ["pre-commit-hooks"];
    };
    packages = with pkgs; [
      # lsps
      inputs'.nixd.packages.nixd
      markdown-oxide
      ltex-ls-plus
      #formatters
      alejandra
      #linters
      codespell
      vale
      markdownlint-cli2
      #etc
      nix-melt
    ];
    git-hooks = {
      enabledPackages = with pkgs; [
        flake-checker
        gitleaks
        trufflehog
        statix
        config.treefmt.build.wrapper
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
          package = config.treefmt.build.wrapper;
          enable = true;
        };
      };
    };
  };
}
