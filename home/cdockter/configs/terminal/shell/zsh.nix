{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      dotDir = ".config/zsh";
      syntaxHighlighting.enable = true;
      initContent =
        #bash
        ''
          zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
          zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
          zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
          zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default
        '';
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "thefuck"
          "colored-man-pages"
          "tmux"
          "alias-finder"
        ];
      };
    };
  };
}
