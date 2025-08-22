{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem =
    { config, ... }:
    {
      treefmt.config = {
        flakeCheck = true;
        projectRootFile = "flake.nix";

        programs = {
          # keep-sorted start block=yes
          deadnix.enable = true;
          keep-sorted.enable = true;
          mdformat.enable = true;
          nixf-diagnose.enable = true;
          nixfmt.enable = true;
          statix.enable = true;
          stylua = {
            settings = {
              column_width = 80;
              indent_type = "Spaces";
              indent_width = 2;
              quote_style = "AutoPreferDouble";
              call_parentheses = "None";
              sort_requires.enabled = true;
            };
          };
          typos = {
            enable = true;
            threads = 2;
          };
          # keep-sorted end

        };
        settings = {
          global.excludes = [
            ".envrc"
            "flake.lock"
            "*.png"
          ];
        };
      };
    };
}
