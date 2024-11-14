{ ... }:
{
  home = {
    shellAliases = {
      cd = "z";
    };
  };
  programs = {
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      dotDir = ".config/zsh";
      syntaxHighlighting.enable = true;
      initExtra =
        #bash
        ''
          zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
          zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
          zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
          zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default
          export PATH=$PATH:/home/cdockter/.local/bin
        '';
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "thefuck"
          "colored-man-pages"
          "cp"
          "zoxide"
          "tmux"
          "alias-finder"
        ];
      };
    };
    starship =
      let
        tokyo_night = builtins.fromTOML (builtins.readFile ./tokyo-night.toml);
      in
      {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableTransience = true;
        # settings = tokyo_night;
      };
  };
}
