{
  programs.fish = {
    enable = true;
    generateCompletions = true;
    functions = {
      __tf_updt = {
        body =
          #fish
          "
            set -l tf_vers (thefuck -v 2>&1)
  if test \"$__tf_vers\" != \"$tf_vers\" -o -z \"$__tf_func\"
    set -U __tf_vers $tf_vers
    set -U __tf_func (thefuck -a \"__tf_alias\" | tr \"\n\" \";\")
    eval $__tf_func
          ";
      };
      fuck = {
        body =
          #fish
          "
            __tf_alias
            fish -c __tf_updt 2>&1 > /dev/null &
          ";
      };
      the-fuck-command-line = {
        body =
          #fish
          "
          env THEFUCK_REQUIRE_CONFIRMATION=0 thefuck $history[1] 2> /dev/null | read fuck
  [ -z $fuck ]; and return
  commandline -r $fuck
          ";
      };
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
        bind \e\e 'thefuck-command-line'
        fish_add_path --append ~/.local/bin
        set -g fish_greeting ""
      '';
  };
}
