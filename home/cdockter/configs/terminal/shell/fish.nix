{
  programs.fish = {
    enable = true;
    generateCompletions = true;
    functions = {
      sesh_sessions = {
        body =
          # fish
          "
          set session (sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')


          if test -z \"$session\"
              return
          end

          sesh connect $session
          ";
      };
    };
    shellAbbrs = {
      cpv =
        # fish
        "rsync -pogbr -hhh --backup-dir=\"/tmp/rsync-$USERNAME\" --progress";
      tkss = "tmux kill-session ";
      tksv = "tmux kill-server";
      ta = "tmux attach ";
      g =
        # fish
        "git";
      ga =
        # fish
        "git add";
      gaa =
        # fish
        "git add --all";
      gc =
        # fish
        "git commit";
      gl =
        # fish
        "git pull";
      gp =
        # fish
        "git push";
      gcl =
        # fish
        "git clone";
      grtr =
        # fish
        "cd \"$(git rev-parse --show-toplevel || echo .)\"";
      cdi =
        # fish
        "__zoxide_zi";
      man =
        # fish
        "batman";
    };

    interactiveShellInit =
      #fish
      ''
        set -g fish_key_bindings fish_vi_key_bindings
        bind \es 'sesh_sessions'
        fish_add_path --append ~/.local/bin
        set -g fish_greeting ""
      '';
  };
}
