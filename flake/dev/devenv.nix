{
  inputs,
  ...
}:
{
  imports = [ inputs.devenv.flakeModule ];
  perSystem =
    {
      pkgs,
      config,
      self',
      inputs',
      system,
      ...
    }:
    {
      devenv.shells.default = {
        packages = with pkgs; [
          # lsps
          lua-language-server
          inputs'.nixd.packages.nixd
          markdown-oxide
          vale-ls
          #formatters
          #linters
          vale
          markdownlint-cli2
          statix
        ];
        git-hooks = {
          default_stages = [ "pre-push" ];
          hooks = {
            treefmt = {
              enable = true;
              package = config.treefmt.build.wrapper;
            };
            convco.enable = true;
          };
        };
      };
    };
}
