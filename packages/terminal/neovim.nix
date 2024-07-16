{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xdotool
    pstree
    #LSPS For Neovim
    lua-language-server
    nil
    rocmPackages.llvm.clang-tools-extra
    pyright
    texlab
    vim-language-server
    marksman
    cmake-language-server
    nodePackages_latest.bash-language-server
    deno
    emacsPackages.lsp-julia
    #Formatters
    stylua
    alejandra
    selene
    bibtex-tidy
    nixpkgs-fmt
    ripgrep
    python312Packages.black
    cmake-format
    #Linters
    # cpplint #FIXME: currently has a bug where it is misspeled even tho this is not found on the gh
    python312Packages.mypy
    ruff
    vale
    #DAPS
    python312Packages.debugpy
    fd
    lldb_18 #clang debugger
  ];
}
