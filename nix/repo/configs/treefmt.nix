{ inputs, cell }:
let

  inherit (inputs.std.lib.dev) mkNixago;
  pkgs = inputs.nixpkgs;
in

{
  treefmt = (mkNixago inputs.std.lib.cfg.treefmt) {
    data = {
      tree-root-file = "flake.nix";
      formatter = {
        taplo = {
          command = "taplo";
          options = [ "format" ];
          includes = [ "*.toml" ];
        };
        nixf-diagnose = {
          command = "nixf-diagnose";
          includes = [ "*.nix" ];
        };
        mdformat = {
          command = "mdformat";
          includes = [ "*.md" ];
        };
        stylua = {
          command = "stylua";
          includes = [ "*.lua" ];
        };
        deadnix = {
          command = "deadnix";
          # options = [ "--edit" ];
          includes = [ "*.nix" ];
        };
        nixfmt = {
          command = "nixfmt";
          includes = [ "*.nix" ];
        };
      };
    };

    packages = with pkgs; [
      nixfmt
      stylua
      deadnix
      statix
      nixf-diagnose
      taplo
      mdformat
    ];
  };
}
