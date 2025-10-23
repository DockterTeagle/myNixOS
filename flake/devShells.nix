{
  perSystem =
    {
      pkgs,
      inputs',
      config,
      ...
    }:
    {
      devShells = {
        default = pkgs.mkShell {
          packages = with pkgs; [
            inputs'.flint.packages.default
            config.treefmt.build.wrapper
            nixd
            statix
            emmylua-ls
          ];
        };
      };

    };
}
