let
  inherit
    (builtins)
    concatStringsSep
    ;
  vertical = "┃ ";
  corner_top = "⎧ "; # Top corner
  corner_bottom = "╰ "; # Bottom corner"
in {
  add_newline = false;
  format = concatStringsSep "" [
    "${corner_top}$username"
    "$hostname"
    "$kubernetes"
    "$vcsh"
    "$git_branch"
    "$git_commit"
    "$git_state"
    "$git_metrics"
    "$git_status"
    "$hg_branch"
    "$docker_context"
    "(\n"
    "${vertical}"
    " $direnv"
    "$package"
    "$cmake"
    "$dart"
    "$deno"
    "$dotnet"
    "$elixir"
    "$elm"
    "$erlang"
    "$golang"
    "$helm"
    "$java"
    "$julia"
    "$kotlin"
    "$nim"
    "$nodejs"
    "$ocaml"
    "$perl"
    "$php"
    "$purescript"
    "$python"
    "$red"
    "$ruby"
    "$rust"
    "$scala"
    "$swift"
    "$terraform"
    "$vlang"
    "$vagrant"
    "$zig"
    "$nix_shell"
    "$conda"
    "$memory_usage"
    "$aws"
    "$gcloud"
    "$openstack"
    "$env_var"
    "$crystal"
    "$cmd_duration"
    "$lua"
    "$jobs)"
    "\n"
    "${vertical}$directory"
    "\n"
    "${corner_bottom}$status"
    " [ $shell](bold)"
    "$character"
    # "${corner_bottom}"
  ];
  directory = {
    truncation_length = 0;
    format = " [ : $path]($style)[$read_only]($read_only_style) ";
  };
  direnv.disabled = false;
  shell.disabled = false;
  shlvl = {
    disabled = false;
    threshold = 2;
    style = "bold red";
    symbol = "";
  };
  status = {
    disabled = false;
    symbol = " ";
  };
  username = {
    show_always = true;
    format = " [  $user]($style) ";
  };
  git_state.disabled = true;
  git_commit.disabled = true;
  git_metrics.disabled = true;
  git_branch = {
    disabled = true;
    format = "[$symbol$branch]($style) ";
  };
  nix_shell = {
    format = "via [$symbol$state]($style) ";
  };
  custom = {
    git_branch = {
      when = true;
      command = "jj root >/dev/null 2>&1 || starship module git_branch";
      description = "Only show git_branch if we're not in a jj repo";
    };
    jj = {
      ignore_timeout = true;
      description = "The current jj status";
      command =
        #bash
        ''
                  jj log --revisions @ --no-graph --ignore-working-copy --color always --limit 1 --template '
            separate(" ",
              change_id.shortest(4),
              bookmarks,
              "|",
              concat(
                if(conflict, "💥"),
                if(divergent, "🚧"),
                if(hidden, "👻"),
                if(immutable, "🔒"),
              ),
              raw_escape_sequence("\x1b[1;32m") ++ if(empty, "(empty)"),
              raw_escape_sequence("\x1b[1;32m") ++ coalesce(
                truncate_end(29, description.first_line(), "…"),
                "(no description set)",
              ) ++ raw_escape_sequence("\x1b[0m"),
            )
          '
        '';
    };
  };
  aws.symbol = " ";
  conda.symbol = " ";
  dart.symbol = " ";
  directory.read_only = "";
  docker_context.symbol = " ";
  elixir.symbol = " ";
  elm.symbol = " ";
  git_branch.symbol = " ";
  golang.symbol = " ";
  hg_branch.symbol = " ";
  java.symbol = " ";
  julia.symbol = " ";
  memory_usage.symbol = "󰍛 ";
  nim.symbol = " ";
  nix_shell.symbol = " ";
  package.symbol = "󰏗 ";
  perl.symbol = " ";
  php.symbol = " ";
  python.symbol = " ";
  ruby.symbol = " ";
  rust.symbol = " ";
  scala.symbol = " ";
  swift.symbol = "ﯣ ";
}
