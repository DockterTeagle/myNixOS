{
  perSystem =
    {
      pkgs,
      config,
      inputs',
      ...
    }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          # inputs'.flint.packages.default
          config.treefmt.build.wrapper
          inputs'.nixd.packages.default
          statix
          emmylua-ls
          harper
          git-cliff
          # nix-melt
        ];
      };
    };
}
