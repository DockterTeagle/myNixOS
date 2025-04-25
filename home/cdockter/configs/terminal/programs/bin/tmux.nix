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
        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"
      '';
  };
}
