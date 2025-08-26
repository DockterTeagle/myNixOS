{
  inputs,
  cell,
}:
let
  inherit (inputs) nixpkgs;
  pkgs = nixpkgs;
in
{
  neovim = inputs.nixpkgs.extend inputs.neorocks.overlays.default;
  gen-luarc = inputs.nixpkgs.extend inputs.gen-luarc.overlays.default;
  treefmt-nix = inputs.nixpkgs.treefmt.withConfig {
    runtimeInputs = with pkgs; [
      nixfmt
      stylua
      deadnix
      nixf-diagnose
    ];

    settings = {
      on-unmatched = "info";
      tree-root-file = "flake.nix";
      formatter = {
        # nixf-diagnose = {
        #   command = "nixf-diagnose";
        #   includes = [ "**.nix" ];
        # };
        # statix = {
        #   command = cell.pkgs.writeShellScriptBin "statix-fix" ''
        #       for file in "$@"; do
        #       ${lib.getExe cfg.package} fix --config '${toString settingsDir}/statix.toml' "$file"
        #     done'';
        #   includes = [ "*.nix" ];
        # };
        stylua = {
          command = "stylua";
          includes = [ "*.lua" ];
        };
        deadnix = {
          command = "deadnix";
          includes = [ "*.nix" ];
        };
        nixfmt = {
          command = "nixfmt";
          includes = [ "*.nix" ];
        };
      };
    };
  };
}
