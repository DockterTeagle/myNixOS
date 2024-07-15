{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;
    baseIndex = 1;
    clock24 = true;
    sensibleOnTop = true;
    keyMode = "vi";
    shortcut = "space";
    newSession = true;
    # terminal = "alacritty";
    mouse = true;
    tmuxp.enable = true;
    tmuxinator.enable = true;
    plugins = with pkgs.tmuxPlugins; [
      yank
      vim-tmux-navigator
      tmux-fzf
      tokyo-night-tmux
      tmux-thumbs
      sidebar
      # {
      #   plugin = catppuccin;
      #   extraConfig = "set -g @catppuccin_flavour 'mocha'";
      # }
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
