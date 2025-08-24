{
  perSystem =
    {
      pkgs,
      config,
      inputs',
      ...
    }:
    {
      devShells = {
        default =

          let
            luarcPlugins = with pkgs.vimPlugins; [
              # keep-sorted start
              FixCursorHold-nvim
              blink-cmp
              blink-cmp-conventional-commits
              bufferline-nvim
              clangd_extensions-nvim
              cmake-tools-nvim
              colorful-menu-nvim
              comment-nvim
              conform-nvim
              cord-nvim
              diffview-nvim
              flash-nvim
              gitsigns-nvim
              grug-far-nvim
              hardtime-nvim
              inputs'.rustaceanvim.packages.default
              lazy-nvim
              lazydev-nvim
              lualine-nvim
              luasnip
              markview-nvim
              mini-ai
              mini-pairs
              mini-surround
              neogit
              neotest
              neotest-python
              neotest-zig
              noice-nvim
              nui-nvim
              nvim-dap
              nvim-dap-python
              nvim-dap-ui
              nvim-dap-virtual-text
              nvim-lint
              nvim-nio
              nvim-notify
              nvim-treesitter
              nvim-ufo
              nvim-web-devicons
              obsidian-nvim
              plenary-nvim
              promise-async
              snacks-nvim
              todo-comments-nvim
              toggleterm-nvim
              tokyonight-nvim
              trouble-nvim
              vim-jjdescription
              vim-tmux-navigator
              vim-wakatime
              vimtex
              which-key-nvim
              yanky-nvim
              yazi-nvim
              # keep-sorted end
            ];
            luarc-nightly = pkgs.mk-luarc {
              nvim = pkgs.neovim-nightly;
              plugins = luarcPlugins;
            };
          in
          pkgs.mkShell {
            shellHook =
              #bash
              ''
                ${config.pre-commit.installationScript}
                          ln -fs ${pkgs.luarc-to-json luarc-nightly} .luarc.json
              '';
            packages = with pkgs; [
              # lsps
              emmylua-ls
              nixd
              markdown-oxide
              vale-ls
              #formatters
              #linters
              vale
              git-cliff
              markdownlint-cli2
              statix
              config.treefmt.build.wrapper
            ];
          };
      };

    };
}
