{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    #DAPS
    python312Packages.debugpy
    fd
    vscode-extensions.vadimcn.vscode-lldb.adapter
    bibtex-tidy
  ];
}
