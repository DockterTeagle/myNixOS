{
  programs.nushell = {
    shellAliases = {
      ta =
        #nu
        "tmux attach";
      g =
        #nu
        "git";
      ga = "git add";
      gaa = "git add --all";
      gc = "git commit";
      gl = "git pull";
      gp = "git push";
      gcl = "git clone";
      grtr = "cd \"$(git rev-parse --show-toplevel || echo .)\"";
      cdi = "__zoxide_zi";
      man = "batman";
      cd = "__zoxide_z";
    };
    enable = true;
    envFile.text =
      #nu
      ''
        $env.TRANSIENT_PROMPT_COMMAND = ">"
      '';
    settings = {
      buffer_editor = "nvim";
      show_banner = false;
      edit_mode = "vi";
    };
  };
}
