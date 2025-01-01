{
  programs.fish = {
    enable = true;
    generateCompletions = true;
    functions =
      {
      };
    loginShellInit =
      #fish
      ''
        fish_vi_key_bindings;

        bind --mode insert \t fish_vi_on_paging
      '';
    shellAliases = {
      tksv = "tmux kill-server";
      tmuxconf = "$EDITOR $ZSH_TMUX_CONFIG";
      ta = "tmux attach -t";
      tad = "tmux attach -d -t";
      tkss = "tmux kill-session -t";
    };

    interactiveShellInit = ''
      bind --mode insert \t fish_vi_on_paging

      set -g fish_greeting ""
    '';
  };
}
