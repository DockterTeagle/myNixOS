{
  pkgs,
  config,
  ...
}:
{
  devenv.shells.default = {
    cachix = {
      enable = true;
      pull = [ "pre-commit-hooks" ];
    };
    packages = with pkgs; [
      # lsps
      lua-language-server
      nixd
      markdown-oxide
      #formatters
      config.treefmt.build.wrapper
      #linters
      codespell
      vale-ls
      markdownlint-cli2
      statix
    ];
  };
}
