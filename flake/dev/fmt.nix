{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];
  perSystem =
    { config, pkgs, ... }:
    {
      treefmt.config = {
        projectRootFile = "flake.nix";
        flakeFormatter = true;
        flakeCheck = true;
        programs = {
          isort.enable = true;
          keep-sorted.enable = true;
          nixfmt.enable = true;
          statix.enable = true;
          stylua.enable = true;
          taplo.enable = true;
        };
      };
      # formatter = pkgs.treefmt.withConfig {
      #   runtimeInputs = with pkgs; [
      #     nixfmt
      #     mdformat
      #     nixf-diagnose
      #     deadnix
      #     stylua
      #   ];
      #   settings = {
      #     on-umatched = "info";
      #     tree-root-file = "flake.nix";
      #     formatter = {
      #       mdformat = {
      #         command = "mdformat";
      #         includes = [ "*.md" ];
      #       };
      #       stylua = {
      #         command = "stylua";
      #         includes = [ "*.lua" ];
      #       };
      #       deadnix = {
      #         command = "deadnix";
      #         args = [ "--edit" ];
      #         includes = [ "*.nix" ];
      #       };
      #       nixf-diagnose = {
      #         command = "nixf-diagnose";
      #         includes = [ "*.nix" ];
      #       };
      #       nixfmt = {
      #         command = "nixfmt";
      #         includes = [ "*.nix" ];
      #       };
      #     };
      #   };
      # };
    };
}
