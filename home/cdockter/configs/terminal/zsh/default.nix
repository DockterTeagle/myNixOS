{
  home = {
    shellAliases = {
      cd = "z";
    };
  };
  programs = {
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      dotDir = ".config/zsh";
      syntaxHighlighting.enable = true;
      initExtra =
        #bash
        ''
            zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
            zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
            zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
            zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default
            export PATH=$PATH:/home/cdockter/.local/bin
            alias AlecaFrame='protonhax run 230410 "/home/cdockter/.local/share/Steam/steamapps/compatdata/230410/pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Overwolf/AlecaFrame.lnk"'
            function sesh-sessions() {
            {
              exec </dev/tty
              exec <&1
              local session
              session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
              zle reset-prompt > /dev/null 2>&1 || true
              [[ -z "$session" ]] && return
              sesh connect $session
            }
          }

          zle     -N             sesh-sessions
          bindkey -M emacs '\es' sesh-sessions
          bindkey -M vicmd '\es' sesh-sessions
          bindkey -M viins '\es' sesh-sessions
        '';
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "thefuck"
          "colored-man-pages"
          "cp"
          "zoxide"
          "tmux"
          "alias-finder"
        ];
      };
    };
    starship =
      # let
      #   tokyo_night = builtins.fromTOML (builtins.readFile ./tokyo-night.toml);
      # in
      {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableTransience = true;
        settings =
          let
            inherit (builtins)
              concatStringsSep
              ;
            vertical = "||";
          in
          {
            add_newline = false;
            format = concatStringsSep "" [
              "\n"
              "[╓](bold)"
              "$fill"
              "\n"
              vertical
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
              "$package"
              "$cmake"
              "$dart"
              "$deno"
              "$direnv"
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
              "\${custom.mob}"
              "$conda"
              "$memory_usage"
              "$aws"
              "$gcloud"
              "$openstack"
              "$env_var"
              "$crystal"
              "$cmd_duration"
              "$lua"
              "$jobs"
              "$battery"
              "\n"
              vertical
              "$directory"
              "\n"
              vertical
              "$status"
              " [ $shell](bold)"
              "$shlvl"
              "$character"
            ];
            fill = {
              symbol = "─";
              style = "bold";
            };
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
            git_branch = {
              format = "[$symbol$branch]($style) ";
            };
            nix_shell = {
              format = "via [$symbol$state]($style) ";
            };
            custom.mob = {
              command = "echo $MOB_TIMER_ROOM";
              format = "[ ($output)]($style) ";
              when = "[[ -v MOB_TIMER_ROOM ]]";
            };
            aws.symbol = " ";
            conda.symbol = " ";
            dart.symbol = " ";
            directory.read_only = " ";
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
          };
      };
  };
}
