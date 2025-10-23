---@type vim.lsp.ClientConfig
return {
  root_markers = { "flake.nix", ".git" },
  cmd = {
    "nixd",
  },
  filetypes = { "nix" },
  settings = {
    nixd = {
      inlay_hints = true,
      formatting = {
        command = { "nixfmt" },
      },
      nixpkgs = {
        expr = "(builtins.getFlake (builtins.toString ./.)).inputs.nixpkgs {}",
      },
      options = {
        nixOptions = {
          expr = '(builtins.getFlake "/home/cdockter/Documents/myNixOS").nixosConfigurations.nixos.options',
        },
        home_manager = {
          expr = '(builtins.getFlake "/home/cdockter/Documents/myNixOS").homeConfigurations."cdockter".options',
        },
        flake_parts = {
          expr = "(builtins.getFlake (builtins.toString ./.)).debug.options",
        },
        perSystem = {
          expr = "(builtins.getFlake (builtins.toString ./.)).currentSystem.options",
        },
      },
    },
  },
}
