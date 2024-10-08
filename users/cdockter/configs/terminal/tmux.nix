{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;
    escapeTime = 0;
    baseIndex = 1;
    clock24 = true;
    sensibleOnTop = true;
    keyMode = "vi";
    shortcut = "space";
    newSession = true;
    terminal = "tmux-256color";
    mouse = true;
    tmuxp.enable = true;
    tmuxinator.enable = true;
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      continuum
      copycat
      yank
      open
      vim-tmux-navigator
      tmux-fzf
      tokyo-night-tmux
      tmux-thumbs
      session-wizard
    ];
    extraConfig = ''
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

        # Shift arrow to switch windows
      bind -n S-Left  previous-window
      bind -n S-Right next-window

        # Shift Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window

      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
    '';
  };
}
