{
  inputs,
  cell,
}:
let
  inherit (inputs) nixpkgs ;
  inherit (inputs.std.data) configs;
  inherit (inputs.std.lib.dev) mkNixago;
  l = nixpkgs.lib // builtins;
  pkgs = inputs.nixpkgs;
  luarc-nightly = cell.toolchain.gen-luarc.mk-luarc {
    nvim = cell.toolchain.neovim.neovim-nightly;
    plugins = luarcPlugins;
  };
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
    inputs.rustaceanvim.packages.default
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
  /*
    While these are strictly specializations of the available
    Nixago Pebbles at `lib.cfg.*`, it would be entirely
    possible to define a completely new pebble inline
  */
in
{
  # conform = std.std.nixago.conform {
  #      # The configuration of Conform is a bit different than the expected file
  #   # format. This is to prevent excessive nested attribute sets. In this case,
  #   # we only need to specify either a `commit` or `license` parent attribute
  #   # and then the child contents match what is specified in the Conform README.
  #   configData = {
  #     commit = {
  #       header = { length = 89; };
  #       conventional = {
  #         # Only allow these types of conventional commits (inspired by Angular)
  #         types = [
  #           "build"
  #           "chore"
  #           "ci"
  #           "docs"
  #           "feat"
  #           "fix"
  #           "perf"
  #           "refactor"
  #           "style"
  #           "test"
  #         ];
  #       };
  #     };
  #   };
  # };
  # # treefmt: https://github.com/numtide/treefmt
  # treefmt = lib.cfg.treefmt {
  #   # we use the data attribute to modify the
  #   # target data structure via a simple data overlay
  #   # (`divnix/data-merge` / `std.dmerge`) mechanism.
  #   data.formatter.go = {
  #     command = "gofmt";
  #     options = [ "-w" ];
  #     includes = [ "*.go" ];
  #   };
  #   # for the `std.lib.dev.mkShell` integration with nixago,
  #   # we also hint which packages should be made available
  #   # in the environment for this "Nixago Pebble"
  #   packages = [ nixpkgs.go ];
  # };
  #
  # # editorconfig: https://editorconfig.org/
  # editorconfig = lib.cfg.editorconfig {
  #   data = {
  #     # the actual target data structure depends on the
  #     # Nixago Pebble, and ultimately, on the tool to configure
  #     "*.xcf" = {
  #       charset = "unset";
  #       end_of_line = "unset";
  #       insert_final_newline = "unset";
  #       trim_trailing_whitespace = "unset";
  #       indent_style = "unset";
  #       indent_size = "unset";
  #     };
  #     "{*.go,go.mod}" = {
  #       indent_style = "tab";
  #       indent_size = 4;
  #     };
  #   };
  # };
  treefmt =(mkNixago configs.treefmt){
      data = {
          formatter = {
          nixf-diagnose = {command = "nixf-diagnose";
          includes = ["*.nix"];};
          statix = {
              command = "statix-fix";
              includes = ["*.nix"];
            };
          stylua = {command = "stylua"; includes = ["*.lua"];};
          deadnix = {
              command = "deadnix";
              includes = ["*.nix"];
              options = ["--edit"];
            };
          nixfmt = {
              command = "nixfmt";
              includes = ["*.nix"];
            };
        };
  lefthook = (mkNixago configs.lefthook) {
    data = {
      # commit-msg.commands.conform.run ="${nixpkgs.conform}/bin/conform enforce ==commit-msg-file {1}";
      pre-commit.commands = {
        treefmt.run = "${pkgs.treefmt}/bin/treefmt {staged_files}";
        #       pre-commit-hook-ensure-sops.enable = true;
        #       trufflehog.enable = true;
        #       convco.enable = true;
        # trufflehog.run = ''
        #   set -e
        #   ${nixpkgs.trufflehog}/bin/trufflehog git git " "file://$" (
        #     git rev-parse - -show-toplevel
        #   ) " --since-commit HEAD --only-verified --fail"'';
      };
    };

# lefthook = lib.cfg.lefthook{};
  # mdbook: https://rust-lang.github.io/mdBook
  # mdbook = lib.cfg.mdbook {
  #   data = {
  #     book.title = "The Standard Book";
  #   };
  # };
};}
  luarc = mkNixago {
    output = ".luarc.json";
    format = "json";
    data = luarc-nightly;
  };
}
