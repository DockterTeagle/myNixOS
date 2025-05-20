{
  # config,
  pkgs,
  # inputs,
  ...
}: {
  # xdg.configFile."nvim" = {
  #   recursive = true;
  #   source = ./nvim;
  # };
  #   ripgrep
  home.packages = with pkgs; [
    git-absorb
  ];
  programs.neovim = {
    # package = pkgs.neovim;
    enable = true;
    # plugins = with pkgs.vimPlugins; [
    #   lazy-nvim
    #   aerial-nvim
    #   aw-watcher-vim
    #   blink-ripgrep-nvim
    #   # blink-cmp
    #   inputs.blink-cmp.packages.${pkgs.system}.default
    #   bufferline-nvim
    #   comment-nvim
    #   cord-nvim
    #   edgy-nvim
    #   flash-nvim
    #   gitsigns-nvim
    #   lazy-nvim
    #   lualine-nvim
    #   luasnip
    #   mini-ai
    #   mini-icons
    #   mini-pairs
    #   noice-nvim
    #   nui-nvim
    #   nvim-colorizer-lua
    #   nvim-dap
    #   nvim-lint
    #   nvim-lspconfig
    #   nvim-notify
    #   nvim-treesitter
    #   nvim-treesitter-parsers.nix
    #   nvim-treesitter-textobjects
    #   oil-nvim
    #   persistence-nvim
    #   plenary-nvim
    #   rustaceanvim
    #   snacks-nvim
    #   sqlite-lua
    #   telescope-frecency-nvim
    #   todo-comments-nvim
    #   toggleterm-nvim
    #   tokyonight-nvim
    #   ts-comments-nvim
    #   vim-tmux-navigator
    #   vimtex
    #   which-key-nvim
    #   yanky-nvim
    #   yazi-nvim
    #   clangd_extensions-nvim
    #   cmake-tools-nvim
    #   colorful-menu-nvim
    #   compiler-nvim
    #   conform-nvim
    #   crates-nvim
    #   diffview-nvim
    #   FixCursorHold-nvim
    #   grug-far-nvim
    #   harpoon2
    #   inc-rename-nvim
    #   lazydev-nvim
    #   ltex_extra-nvim
    #   luvit-meta
    #   markdown-preview-nvim
    #   render-markdown-nvim
    #   mini-surround
    #   neogen
    #   neogit
    #   neotest
    #   neotest-python
    #   neotest-zig
    #   nvim-dap-python
    #   nvim-dap-ui
    #   nvim-dap-virtual-text
    #   nvim-lightbulb
    #   nvim-nio
    #   nvim-scissors
    #   nvim-ufo
    #   overseer-nvim
    #   promise-async
    #   refactoring-nvim
    #   telescope-fzf-native-nvim
    #   telescope-nvim
    #   trouble-nvim
    # ];
    # extraLuaConfig =
    #   #lua
    #   ''
    #     require("globals")
    #
    #     require("options")
    #     _G.LazyVim = require("util")
    #     vim.schedule(function()
    #     	require("mappings")
    #     end)
    #     vim.schedule(function()
    #     	require("autocmds")
    #     end)
    #     require("lazy").setup({
    #     	performance = {
    #     		reset_packpath = false,
    #     		rtp = {
    #     			reset = false,
    #     		},
    #     	},
    #     	dev = {
    #     		path = "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
    #     	},
    #     	install = {
    #     		-- Safeguard in case we forget to install a plugin with Nix
    #     		missing = false,
    #     	},
    #     	{ import = "plugins.general" },
    #     	{ import = "plugins.FolkePlugins" },
    #     	{ import = "plugins.ftplugin" },
    #     }, require("configs.lazy"))
    #   '';
    defaultEditor = true;
    vimdiffAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withRuby = true;
    withPython3 = true;
  };
}
