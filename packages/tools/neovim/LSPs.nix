{ pkgs, ... }: {
  environment.systemPackages = with pkgs;[
    lua-language-server
    pyright
    ruff-lsp
    texlab
    vim-language-server
    marksman
    cmake-language-server
    nodePackages_latest.bash-language-server
    nixd
    deno
    emacsPackages.lsp-julia
    vscode-langservers-extracted
    matlab-language-server
    python312Packages.python-lsp-jsonrpc
  ];
}
