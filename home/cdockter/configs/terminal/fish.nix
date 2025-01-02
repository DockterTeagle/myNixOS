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

      '';
    shellAbbrs = {
      tkss = "tmux kill-session ";
      tksv = "tmux kill-server";
      ta = "tmux attach ";
      g = # fish
        "git";
      ga = # fish
        "git add";
      gaa = # fish
        "git add --all";
      gl = # fish
        "git pull";
      gp = # fish
        "git push";
      grtr = # fish
        "cd \"$(git rev-parse --show-toplevel || echo .)\"";
    };

    interactiveShellInit = ''

      set -g fish_greeting ""
    '';
  };
}
