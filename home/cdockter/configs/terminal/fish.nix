{
  programs.fish = {
    enable = true;
    generateCompletions = true;
    functions = {
      sesh_sessions = {
        body = # fish
          "
           exec </dev/tty
          exec <&1
          set session (sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')


          if test -z \"$session\"
              return
          end

          sesh connect $session
          ";
      };
    };
    loginShellInit =
      #fish
      ''

      '';
    shellAbbrs = {
      cpv = # fish
        "rsync -pogbr -hhh --backup-dir=\"/tmp/rsync-$USERNAME\" --progress";
      tkss = "tmux kill-session ";
      tksv = "tmux kill-server";
      ta = "tmux attach ";
      g = # fish
        "git";
      ga = # fish
        "git add";
      gaa = # fish
        "git add --all";
      gc = # fish
        "git commit";
      gl = # fish
        "git pull";
      gp = # fish
        "git push";
      update = # fish
        "topgrade";
      grtr = # fish
        "cd \"$(git rev-parse --show-toplevel || echo .)\"";
      cdi = # fish
        "__zoxide_zi";
      cd = # fish
        "__zoxide_z";
    };

    interactiveShellInit = ''

      set -g fish_greeting ""
    '';
  };
}
