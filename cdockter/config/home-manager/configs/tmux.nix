{pkgs,...}:
{
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;
    baseIndex = 1;
    clock24 = true;
    keyMode = "vi";
    prefix = "C-space";
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

      set -g @catppuccin_flavour 'mocha'

      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'christoomey/vim-tmux-navigator'
      set -g @plugin 'dreamsofcode-io/catppuccin-tmux'
      set -g @plugin 'tmux-plugins/tmux-yank'
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      run '~/.config/tmux/plugins/tpm/tpm'
      if "test ! -d ~/.config/tmux/plugins/tpm" \
     "run 'git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm && ~/.config/tmux/plugins/tpm/bin/install_plugins'"

    '';
  };
}