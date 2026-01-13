{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      tkss = "tmux kill-session ";
      tksv = "tmux kill-server";
      ta = "tmux attach ";
      man = "batman";
    };
    interactiveShellInit =
      #fish
      ''
        set -g fish_key_bindings fish_vi_key_bindings
        set -g fish_greeting ""
      '';
  };
}
