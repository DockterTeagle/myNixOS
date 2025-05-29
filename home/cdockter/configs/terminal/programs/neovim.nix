{pkgs, ...}: {
  home.packages = with pkgs; [
    git-absorb
    tree-sitter
    inotify-tools
  ];
  programs.neovim = {
    enable = true;
    viAlias = true;
    defaultEditor = true;
    vimdiffAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withRuby = true;
    withPython3 = true;
  };
}
