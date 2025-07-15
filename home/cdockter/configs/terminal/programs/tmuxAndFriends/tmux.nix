{ pkgs, ... }:
{
  programs.tmux = {
    escapeTime = 0;
    baseIndex = 1;
    sensibleOnTop = true;
    keyMode = "vi";
    shortcut = "space";
    newSession = true;
    terminal = "screen-256color";
    mouse = true;
    focusEvents = true;
    disableConfirmationPrompt = true;
    plugins = with pkgs.tmuxPlugins; [
      pain-control
      yank
      tokyo-night-tmux
      vim-tmux-navigator
      tmux-fzf
      tmux-thumbs
    ];
    extraConfig =
      #tmux
      ''
        set -g detach-on-destroy off
        set -g allow-passthrough on
        set-option -g cursor-style 'blinking-bar'
        set-option -g status-position top
        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"
      '';
  };
}
