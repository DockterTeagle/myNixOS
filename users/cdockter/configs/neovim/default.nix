{ pkgs, lib, stdenv, fetchFromGitHub, config, ... }:
#
# let
#   toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
#   sanitizePluginName = input:
#     let
#       name = lib.strings.getName input;
#       intermediate = lib.strings.removePrefix "vimplugin-" name;
#       result = lib.strings.removePrefix "lua5.1-" intermediate;
#     in
#     result;
#   pluginList = plugins: lib.strings.concatMapStrings (plugin: "  [\"${sanitizePluginName plugin.name}\"] = \"${plugin.outPath}\",\n") plugins;
# in
{
  # xdg.configFile."nvim/lua" = {
  #   source = ./NvChad/lua;
  #   recursive = true;
  # };
  programs.neovim =
    {
      # package = pkgs.neovim;
      enable = true;
      defaultEditor = true;
      withNodeJs = true;
      # plugins = with pkgs.vimPlugins;[
      #   lazy-nix-helper-nvim
      #   lazy-nvim
      #   luasnip
      #   nvchad
      #   base46
      #   cmp-buffer
      #   cmp-nvim-lsp
      #   cmp-nvim-lua
      #   cmp-path
      #   cmp_luasnip
      #   compiler-nvim
      #   conform-nvim
      #   crates-nvim
      #   gitsigns-nvim
      #   indent-blankline-nvim
      #   lazydev-nvim
      #   lazygit-nvim
      #   leap-spooky-nvim
      #   leap-nvim
      #   markdown-preview-nvim
      #   neo-tree-nvim
      #   noice-nvim
      #   nui-nvim
      #   nui-components-nvim
      #   nvim-autopairs
      #   nvim-cmp
      #   nvim-colorizer-lua
      #   nvim-dap
      #   nvim-dap-ui
      #   nvim-dap-virtual-text
      #   nvim-lint
      #   nvim-lspconfig
      #   nvim-nio
      #   nvim-notify
      #   nvim-spectre
      #   nvim-treesitter
      #   nvim-treesitter-context
      #   nvim-treesitter-textobjects
      #   nvim-web-devicons
      #   oil-nvim
      #   outline-nvim
      #   overseer-nvim
      #   plenary-nvim
      #   presence-nvim
      #   projectmgr-nvim
      #   refactoring-nvim
      #   rust-vim
      #   rustaceanvim
      #   telescope-bibtex-nvim
      #   telescope-dap-nvim
      #   telescope-file-browser-nvim
      #   telescope-fzf-native-nvim
      #   telescope-undo-nvim
      #   telescope-nvim
      #   tiny-inline-diagnostic-nvim
      #   todo-comments-nvim
      #   trouble-nvim
      #   nvchad-ui
      #   vim-easy-align
      #   vim-repeat
      #   vim-tmux-navigator
      #   vimtex
      #   which-key-nvim
      #   dressing-nvim
      #   neoconf-nvim
      #   neodev-nvim
      #   nui-nvim
      #   tokyonight-nvim
      # ];
      # extraLuaConfig =
      #   ''
      #             local plugins = {
      #     ${pluginList config.programs.neovim.plugins}
      #     }
      #     local lazy_nix_helper_path = "${pkgs.vimPlugins.lazy-nix-helper-nvim}"
      #     if not vim.loop.fs_stat(lazy_nix_helper_path) then
      #       lazy_nix_helper_path = vim.fn.stdpath("data") .. "/lazy_nix_helper/lazy_nix_helper.nvim"
      #       if not vim.loop.fs_stat(lazy_nix_helper_path) then
      #         vim.fn.system({
      #           "git",
      #           "clone",
      #           "--filter=blob:none",
      #           "https://github.com/b-src/lazy_nix_helper.nvim.git",
      #           lazy_nix_helper_path,
      #         })
      #       end
      #     end
      #
      #     -- add the Lazy Nix Helper plugin to the vim runtime
      #     vim.opt.rtp:prepend(lazy_nix_helper_path)
      #
      #     -- call the Lazy Nix Helper setup function
      #     local non_nix_lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      #     local lazy_nix_helper_opts = { lazypath = non_nix_lazypath, input_plugin_table = plugins }
      #     require("lazy-nix-helper").setup(lazy_nix_helper_opts)
      #
      #     -- get the lazypath from Lazy Nix Helper
      #     local lazypath = require("lazy-nix-helper").lazypath()
      #     if not vim.loop.fs_stat(lazypath) then
      #       vim.fn.system({
      #         "git",
      #         "clone",
      #         "--filter=blob:none",
      #         "https://github.com/folke/lazy.nvim.git",
      #         "--branch=stable", -- latest stable release
      #         lazypath,
      #       })
      #     end
      #     vim.opt.rtp:prepend(lazypath)
      #       vim.g.mapleader = " "
      #       vim.schedule(function()
      #       require("mappings")
      #       end)
      #       -- bootstrap lazy and all plugins
      #       require("NUIComponentsProjects.spectreImprovement")
      #   '';
    };


}
#These are here to "save" old options cause nix comments dont(I think) work in extraLuaConfig
# dofile(vim.g.base46_cache .. "defaults")
# dofile(vim.g.base46_cache .. "statusline")
#            ${lib.concatStringsSep ",\n      "(map entry: "'" + entry.path + "'" + "'"+":true")pluginPaths} 


