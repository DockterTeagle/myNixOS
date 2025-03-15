{pkgs, ...}: {
  programs.nushell = {
    shellAliases = {
      ta = "tmux attach";
      g = "git";
      ga = "git add";
      gaa = "git add --all";
      gc = "git commit";
      gl = "git pull";
      gp = "git push";
      gcl = "git clone";
      update = "topgrade";
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
    };
    plugins = with pkgs.nushellPlugins; [
      highlight
      # gstat
      # formats
      # polars
      # query
      # skim
    ];
  };
}
