let
  inherit (builtins)
    concatStringsSep
    ; # Top corner # Bottom corner"
in
{
  add_newline = false;
  format = concatStringsSep "" [
    "$username"
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
    "$direnv"
    "$nix_shell"
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
    "$directory"
    "$status"
    "\n"
    "[ $shell](bold)"
    "$character"
  ];
  directory = {
    truncation_length = 0;
    format = "[ : $path]($style)[$read_only]($read_only_style) ";
  };
  direnv.disabled = false;
  shell.disabled = false;
  status = {
    disabled = false;
    symbol = " ";
  };
  username = {
    show_always = true;
    format = "[  $user]($style) ";
  };
  git_state.disabled = false;
  git_commit.disabled = false;
  git_metrics.disabled = false;
  git_branch = {
    disabled = false;
    format = "[$symbol$branch]($style) ";
  };
  nix_shell = {
    format = "via [$symbol$state]($style) ";
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
