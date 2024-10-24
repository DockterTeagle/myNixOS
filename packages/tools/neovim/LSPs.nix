{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    texlab
    vim-language-server
    marksman
    nodePackages_latest.bash-language-server
    nixd
    deno
    vscode-langservers-extracted
  ];
}
