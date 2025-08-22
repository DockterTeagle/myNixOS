{
  inputs',
  pkgs,
  config,
  ...
}:
{
  devenv.shells.default = {
    packages = with pkgs; [
      # lsps
      lua-language-server
      inputs'.nixd.packages.nixd
      markdown-oxide
      #formatters
      config.treefmt.build.wrapper
      #linters
      codespell
      vale-ls
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
}
