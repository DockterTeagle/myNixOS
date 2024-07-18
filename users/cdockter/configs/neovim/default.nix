{ pkgs, lib, ... }:
#
{
  programs.neovim =
    {
      package = pkgs.neovim;
      enable = true;
      defaultEditor = true;
      withNodeJs = true;
      plugins = with pkgs.vimPlugins;[
        lazy-nvim
      ];
      extraLuaConfig =
        let
          plugins = with pkgs.vimPlugins;[
            luasnip
            nvchad
            base46
            cmp-buffer
            cmp-nvim-lsp
            cmp-nvim-lua
            cmp-path
            cmp_luasnip
            compiler-nvim
            conform-nvim
            crates-nvim
            gitsigns-nvim
            indent-blankline-nvim
            lazydev-nvim
            lazygit-nvim
            leap-spooky-nvim
            leap-nvim
            markdown-preview-nvim
            neo-tree-nvim
            noice-nvim
            nui-nvim
            nui-components-nvim
            nvim-autopairs
            nvim-cmp
            nvim-colorizer-lua
            nvim-dap
            nvim-dap-ui
            nvim-dap-virtual-text
            nvim-lint
            nvim-lspconfig
            nvim-nio
            nvim-notify
            nvim-spectre
            nvim-treesitter
            nvim-treesitter-context
            nvim-treesitter-textobjects
            nvim-web-devicons
            oil-nvim
            outline-nvim
            overseer-nvim
            plenary-nvim
            presence-nvim
            projectmgr-nvim
            refactoring-nvim
            rust-vim
            rustaceanvim
            telescope-bibtex-nvim
            telescope-dap-nvim
            telescope-file-browser-nvim
            telescope-fzf-native-nvim
            telescope-undo-nvim
            telescope-nvim
            tiny-inline-diagnostic-nvim
            todo-comments-nvim
            trouble-nvim
            nvchad-ui
            vim-easy-align
            vim-repeat
            vim-tmux-navigator
            vimtex
            which-key-nvim
            dressing-nvim
            neoconf-nvim
            neodev-nvim
            nui-nvim
            tokyonight-nvim
          ];
          mkEntryFromDrv = drv:
            if lib.isDerivation drv then
              { name = lib.getName drv; path = drv; }
            else
              { name = "plugin"; path = drv; };
          lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
          pluginPaths = map mkEntryFromDrv plugins;
        in
        ''
          local pluginPaths = {
          }
          vim.g.mapleader = " "
          vim.cmd('set runtimepath+=${lazyPath}')
          package.path = package.path .. ';${lazyPath}?.lua'
          vim.o.runtimepath = '${lazyPath},' .. vim.o.runtimepath
          vim.schedule(function()
            require("mappings")
          end)
          -- bootstrap lazy and all plugins
          require("lazy").setup({
            defaults = {
              lazy = true,
            },
            dev = {
              path = "${lazyPath}",
              patterns = {"."},
              fallback = true,
            },
            -- import/override with your plugins
            { import = "plugins" },
            { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = {} } },
            })
           require("NUIComponentsProjects.spectreImprovement")
        '';
    };
  xdg.configFile."nvim-parser".source =
    let
      parsers = pkgs.symlinkJoin {
        name = "treesitter-parsers";
        paths = (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: with plugins; [
          c
          lua
        ])).dependencies;
      };
    in
    "${parsers}/parser";

  xdg.configFile."nvim/lua".source = ./NvChad/lua;
}
#These are here to "save" old options cause nix comments dont(I think) work in extraLuaConfig
# dofile(vim.g.base46_cache .. "defaults")
# dofile(vim.g.base46_cache .. "statusline")
#            ${lib.concatStringsSep ",\n      "(map entry: "'" + entry.path + "'" + "'"+":true")pluginPaths}

