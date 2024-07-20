{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    #DAPS
    python312Packages.debugpy
    fd
    lldb_18 #clang debugger
    bibtex-tidy
  ];
}
