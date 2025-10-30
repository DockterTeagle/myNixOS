{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem.treefmt.config = {
    flakeCheck = true;
    projectRootFile = "flake.nix";

    programs = {
      deadnix.enable = true;
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
        enable = true;
      };

    };
    settings = {
      global.excludes = [
        ".envrc"
        "*.png"
        ".git/**"
      ];
    };
  };
}
