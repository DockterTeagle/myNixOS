{
  inputs,
  ...
}:
{
  imports = [ inputs.devenv.flakeModule ];
  perSystem =
    {
      pkgs,
      config,
      inputs',
      ...
    }:
    let
      luarcPlugins = with pkgs.vimPlugins; [
        # keep-sorted start
        # fff-nvim
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
        vim-dadbod
        vim-dadbod-completion
        vim-dadbod-ui
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
    {
      devenv.shells.default = {
        tasks = {
          "bash:gen-luarc" = {
            exec = "ln -fs ${pkgs.luarc-to-json luarc-nightly} .luarc.json";
            before = [ "devenv:enterShell" ];
          };
        };
        packages = with pkgs; [
          # lsps
          emmylua-ls
          inputs'.nixd.packages.nixd
          markdown-oxide
          vale-ls
          #formatters
          #linters
          vale
          git-cliff
          markdownlint-cli2
          statix
        ];
        git-hooks = {
          default_stages = [ "pre-push" ];
          hooks = {
            pre-commit-hook-ensure-sops.enable = true;
            trufflehog.enable = true;
            treefmt = {
              enable = true;
              package = config.treefmt.build.wrapper;
            };
            convco.enable = true;
          };
        };
      };
    };
}
