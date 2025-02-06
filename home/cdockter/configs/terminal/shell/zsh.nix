{
  programs = {
    thefuck = {
      enableFishIntegration = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      enable = true;
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
            alias AlecaFrame='protonhax run 230410 "/home/cdockter/.local/share/Steam/steamapps/compatdata/230410/pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Overwolf/AlecaFrame.lnk"'
            function sesh-sessions() {
            {
              exec </dev/tty
              exec <&1
              local session
              session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
              zle reset-prompt > /dev/null 2>&1 || true
              [[ -z "$session" ]] && return
              sesh connect $session
            }
          }

          zle     -N             sesh-sessions
          bindkey -M emacs '\es' sesh-sessions
          bindkey -M vicmd '\es' sesh-sessions
          bindkey -M viins '\es' sesh-sessions
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
