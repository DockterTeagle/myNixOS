{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    baseIndex = 1;
    clock24 = true;
    sensibleOnTop = true;
    keyMode = "vi";
    shortcut = "space";
    newSession = true;
    terminal = "screen-256color";
    mouse = true;
    focusEvents = true;
    shell = "${pkgs.fish}/bin/fish";
    tmuxinator.enable = true;
    disableConfirmationPrompt = true;
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      copycat
      pain-control
      yank
      open
      tokyo-night-tmux
      # {
      #   plugin = tmux-powerline;
      #   extraConfig =
      #     #tmux
      #     ''
      #
      #     '';
      # }
      extrakto
      vim-tmux-navigator
      tmux-fzf
      tmux-thumbs
      {
        plugin = continuum;
        extraConfig =
          #tmux
          ''
            set -g @continuum-restore 'on'
          '';
      }
    ];
    extraConfig =
      #tmux
      ''
          set -g detach-on-destroy off
          set -g allow-passthrough on
          set -g focus-events on
          set -g default-terminal "xterm-ghostty"
          bind -n M-Left select-pane -L
          bind -n M-Right select-pane -R
          set-option -g cursor-style 'blinking-bar'
          set-option -ag terminal-features 'xterm-256color:RGB'
          set-option -ag terminal-features 'cstyle'
          bind -n M-Up select-pane -U
          bind -n M-Down select-pane -D

          bind -n S-Left  previous-window
          bind -n S-Right next-window

          bind -n M-H previous-window
          bind -n M-L next-window
          bind -N "last-session (via sesh) " L run-shell "sesh last"
          bind -N "switch to root session (via sesh) " 9 run-shell "sesh connect --root \'$(pwd)\'"
          bind '"' split-window -v -c "#{pane_current_path}"
          bind % split-window -h -c "#{pane_current_path}"
          bind-key "T" run-shell "sesh connect \"$(
            sesh list --icons | fzf-tmux -p 55%,60% \
              --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
              --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
              --bind 'tab:down,btab:up' \
              --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
              --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
              --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
              --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
              --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
              --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
        )\""
      '';
  };
}
