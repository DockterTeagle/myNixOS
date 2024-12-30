{ pkgs, ... }:
{
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
    tmuxp.enable = true;
    # shell = "\${pkgs.zsh}/bin/zsh";
    tmuxinator.enable = true;
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      continuum
      copycat
      yank
      open
      vim-tmux-navigator
      tmux-fzf
      # tokyo-night-tmux
      tmux-thumbs
    ];
    extraConfig =
      #tmux
      ''
          set -g detach-on-destroy off
          set -g allow-passthrough on
          bind -n M-Left select-pane -L
          bind -n M-Right select-pane -R
          bind -n M-Up select-pane -U
          bind -n M-Down select-pane -D

          bind -n S-Left  previous-window
          bind -n S-Right next-window

          bind -n M-H previous-window
          bind -n M-L next-window

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
