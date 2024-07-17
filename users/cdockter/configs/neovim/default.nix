{ pkgs, lib, ... }:
#TODO: add all the neovim plugins here
#non-available Plugins are:
#
#available plugins and their names are:
#NvChad:nvchad
#LuaSnip:LuaSnip
#base46:base46
#cmp-buffer:cmp-buffer
#cmp-nvim-lsp
#cmp-nvim-lua

{
  programs.neovim =
    let
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
      getPluginName = drv: if lib.isDerivation drv then lib.getName drv else "plugin";
      getPluginPath = drv: if lib.isDerivation drv then drv else { outPath = drv; };
      base46Drv = pkgs.vimPlugins.base46;
    in
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
            # { name = "luasnip"; plugin = luasnip; config = toLuaFile ./NvChad/lua/plugins/luasnip.lua; }
            tokyonight-nvim
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
            leap-nvim
            # luavit
            markdown-preview-nvim
            neo-tree-nvim
            noice-nvim
            nui-nvim
            #nui-components
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
            # peek-nvim
            plenary-nvim
            presence-nvim
            #project-mgr
            refactoring-nvim
            rust-vim
            rustaceanvim
            #telescope-bibtex
            telescope-dap-nvim
            #telescope-dapzz-nvim
            telescope-file-browser-nvim
            telescope-fzf-native-nvim
            telescope-undo-nvim
            telescope-nvim
            #tiny-inline-diagnostics
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
          ];
          mkEntryFromDrv = drv:
            if lib.isDerivation drv then
              { name = lib.getName drv; path = drv; }
            else
              { name = "plugin"; path = drv; };
          pluginEntries = builtins.map mkEntryFromDrv plugins;
          lazyPath = pkgs.linkFarm "lazy-plugins" pluginEntries;
          base46Path = getPluginPath pkgs.vimPlugins.base46;
        in
        ''
          vim.g.base46_cache = "${base46Path}" 
          vim.g.mapleader = " "

          -- bootstrap lazy and all plugins

          local lazy_config = require("configs.lazy")
          local overrides = require("configs.overrides")
          -- load theme
          dofile(vim.g.base46_cache .. "defaults")
          dofile(vim.g.base46_cache .. "statusline")

          require("nvchad.autocmds")

          vim.schedule(function()
          	require("mappings")
          end)
          require("NUIComponentsProjects.spectreImprovement")
                    vim.g.mapleader = " "

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
                                -- treesitter handled by xdg.configFile."nvim/parser", put this line at the end of spec to clear ensure_installed
                                { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = {} } },
                                })

                    local lazy_config = require("configs.lazy")
                    local overrides = require("configs.overrides")
                    -- load theme
                    dofile(vim.g.base46_cache .. "defaults")
                    dofile(vim.g.base46_cache .. "statusline")

                    require("nvchad.autocmds")

                    vim.schedule(function()
                    	require("mappings")
                    end)
                    require("NUIComponentsProjects.spectreImprovement")
                              vim.g.mapleader = ' '
                              -- add yours here


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
