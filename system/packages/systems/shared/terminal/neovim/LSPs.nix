{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    vim-language-server
    marksman
    nodePackages_latest.bash-language-server
    vscode-langservers-extracted
  ];
}
