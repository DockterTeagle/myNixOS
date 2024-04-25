
{pkgs, ...}:
{
    home.packages = with pkgs; [
    #LSPS For Neovim
    lua-language-server
    nil
    rocmPackages.llvm.clang-tools-extra # also includes clang-tidy
    nodePackages_latest.pyright
    texlab
    vim-language-server
    marksman
    cmake-language-server
    nodePackages_latest.bash-language-server
    deno
    # julials
    #Formatters
    stylua
    alejandra
    selene
    bibtex-tidy
    nixpkgs-fmt
    python312Packages.black
    cmake-format
    #Linters
    cpplint
    python312Packages.mypy
    ruff
    vale
    #DAPS
    python312Packages.debugpy
    rocmPackages_5.llvm.lldb
    ];
}
