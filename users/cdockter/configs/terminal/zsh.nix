{ ... }:
#TODO: Change these into nix format and change all of these into their respective nerdfont

# {
#   "type": "julia",
#   "style": "diamond",
#   "foreground": "#359a25",
#   "background": "#945bb3",
#   "leading_diamond": " \ue0b6",
#   "trailing_diamond": "\ue0b4 ",
#   "template": "<#ca3c34>\ue624</> {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}"
# },
# {
#   "type": "ruby",
#   "style": "diamond",
#   "foreground": "#9c1006",
#   "background": "#ffffff",
#   "leading_diamond": "\ue0b6",
#   "trailing_diamond": "\ue0b4 ",
#   "template": "\ue791 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}"
# },
# {
#   "type": "azfunc",
#   "style": "diamond",
#   "foreground": "#5398c2",
#   "background": "#ffffff",
#   "leading_diamond": "\ue0b6",
#   "trailing_diamond": "\ue0b4 ",
#   "template": "\uf104<#f5bf45>\uf0e7</>\uf105 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}"
# },
# {
#   "type": "aws",
#   "style": "diamond",
#   "foreground": "#faa029",
#   "background": "#565656",
#   "leading_diamond": "\ue0b6",
#   "trailing_diamond": "\ue0b4 ",
#   "template": "\ue7ad {{.Profile}}{{if .Region}}@{{.Region}}{{end}}"
# },
# {
#   "type": "kubectl",
#   "style": "diamond",
#   "foreground": "#ffffff",
#   "background": "#316ce4",
#   "leading_diamond": "\ue0b6",
#   "trailing_diamond": "\ue0b4",
#   "template": "\uf308 {{.Context}}{{if .Namespace}} :: {{.Namespace}}{{end}}"
# },
let
  ohMyPoshConfig = {

    "$schema" = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json";
    blocks = [
      {
        type = "prompt";
        alignment = "left";
        segments = [
          {
            type = "shell";
            style = "diamond";
            foreground = "#ffffff";
            background = "#0077c2";
            # leading_diamond = "\u256d\u2500\ue0b6";
            template = " {{.Name}} ";
          }
          {
            type = "root";
            style = "diamond";
            foreground = "#FFFB38";
            background = "#ef5350";
            template = "<parentBackround>\ue0b0</> \uf292";
          }
          {
            type = "path";
            style = "powerline";
            powerline_symbol = "\ue0b0";
            foreground = "#2d3436";
            background = "#FF9248";
            template = " \uf07b\uea9c {{ .Path }} ";
            properties = {
              folder_icon = " \uf07b ";
              home_icon = "\ue617";
              style = "folder";
            };
          }
          {
            type = "git";
            style = "powerline";
            powerline_symbol = "\ue0b0";
            foreground = "#011627";
            background = "#FFFB38";
            background_templates = [
              "{{ if or (.Working.Changed) (.Staging.Changed) }}#ffeb95{{ end }}"
              "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#c5e478{{ end }}"
              "{{ if gt .Ahead 0 }}#C792EA{{ end }}"
              "{{ if gt .Behind 0 }}#C792EA{{ end }}"
            ];
            template = " {{ .UpstreamIcon }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }}<#ef5350> \uf046 {{ .Staging.String }}</>{{ end }} ";
            properties = {
              branch_icon = "\ue725";
              fetch_status = true;
              fetch_upstream_icon = true;
            };
          }
          {
            type = "executiontime";
            style = "diamond";
            foreground = "#ffffff";
            background = "#83769c";
            trailing_diamond = "\ue0b4";
            template = " \ueba2 {{ .FormattedMs }}\u2800";
            properties = {
              style = "roundrock";
              threshold = 0;
            };
          }
        ];
      }
      {
        type = "prompt";
        alignment = "right";
        segments = [
          {
            type = "node";
            style = "diamond";
            foreground = "#3C873A";
            background = "#303030";
            leading_diamond = "\ue0b6";
            trailing_diamond = "\ue0b4 ";
            template = "\ue718 {{ if .PackageManagerIcon }}{{ .PackageManagerIcon }} {{ end }}{{ .Full }}";
            properties = {
              fetch_package_manager = true;
              npm_icon = " <#cc3a3a>\ue5fa</> ";
              yarn_icon = " <#348cba>\ue6a7</>";
            };
          }
          {
            type = "python";
            style = "diamond";
            foreground = "#FFE873";
            background = "#306998";
            leading_diamond = "\ue0b6";
            trailing_diamond = "\ue0b4 ";
            template = "\ue235 {{ if .Error }}{{ .Error }}{{ else }}{{ if .Venv }}{{ .Venv }} {{ end }}{{ .Full }}{{ end }}";
          }
          {
            type = "java";
            style = "diamond";
            foreground = "#ffffff";
            background = "#0e8ac8";
            leading_diamond = "\ue0b6";
            trailing_diamond = "\ue0b4 ";
            template = "\ue738 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}";
          }
          {
            type = "dotnet";
            style = "diamond";
            foreground = "#0d6da8";
            background = "#0e0e0e";
            leading_diamond = "\ue0b6";
            trailing_diamond = "\ue0b4 ";
            template = "\ue77f {{ if .Unsupported }}\uf071{{ else }}{{ .Full }}{{ end }}";
          }
          {
            type = "go";
            style = "diamond";
            foreground = "#06aad5";
            background = "#ffffff";
            leading_diamond = "\ue0b6";
            trailing_diamond = "\ue0b4 ";
            template = "\ue626 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}";
          }
          {
            type = "rust";
            style = "diamond";
            foreground = "#925837";
            background = "#f3f0ec";
            leading_diamond = "\ue0b6";
            trailing_diamond = "\ue0b4 ";
          }
          {
            type = "dart";
            style = "diamond";
            foreground = "#055b9c";
            background = "#e1e8e9";
            leading_diamond = " \ue0b6";
            trailing_diamond = "\ue0b4 ";
            template = "\ue798 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}";
          }
          {
            type = "angular";
            style = "diamond";
            foreground = "#ce092f";
            background = "#ffffff";
            leading_diamond = " \ue0b6";
            trailing_diamond = "\ue0b4 ";
            template = "\ue753 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}";
          }
          {
            type = "nx";
            style = "diamond";
            foreground = "#ffffff";
            background = "#1e293b";
            leading_diamond = " \ue0b6";
            trailing_diamond = "\ue0b4 ";
            template = "{{ if .Error }}{{ .Error }}{{ else }}Nx {{ .Full }}{{ end }}";
          }
          {
            type = "os";
            style = "diamond";
            foreground = "#222222";
            background = "#b2bec3";
            leading_diamond = "\ue0b6";
            trailing_diamond = "<transparent,background>\ue0b2</>";
            template = " {{ if .WSL }}WSL at {{ end }}{{.Icon}} ";
            properties = {
              linux = "\ue712";
              macos = "\ue711";
              windows = "\ue70f";
            };
          }
          {
            type = "battery";
            style = "powerline";
            powerline_symbol = "\ue0b2";
            invert_powerline = true;
            foreground = "#262626";
            background = "#f36943";
            background_templates = [
              "{{if eq \"Charging\" .State.String}}#b8e994{{end}}"
              "{{if eq \"Discharging\" .State.String}}#fff34e{{end}}"
              "{{if eq \"Full\" .State.String}}#33DD2D{{end}}"
            ];
            template = " {{ if not .Error }}{{ .Icon }}{{ .Percentage }}{{ end }}{{ .Error }}\uf295 ";
            properties = {
              charged_icon = "\uf240 ";
              charging_icon = "\uf1e6 ";
              discharging_icon = "\ue234 ";
            };
          }
          {
            type = "time";
            style = "diamond";
            invert_powerline = true;
            foreground = "#ffffff";
            background = "#40c4ff";
            leading_diamond = "\ue0b2";
            trailing_diamond = "\ue0b4";
            template = " \uf073 {{ .CurrentDate | date .Format }} ";
            properties = {
              time_format = "_2,15:04";
            };
          }
        ];
      }
      {
        type = "prompt";
        alignment = "left";
        segments = [
          {
            type = "text";
            style = "plain"; #maybe try rich?
            foreground = "#21c7c7";
            template = "\u2570\u2500";
          }
          {
            type = "status";
            style = "plain";
            foreground = "#e0f8ff";
            foreground_templates = [
              "{{ if gt .Code 0 }}#ef5350{{ end }}"
            ];
            template = "\ue285\ueab6 ";
            properties = {
              always_enabled = true;
            };
          }
        ];
        newline = true;
      }
    ];
    version = 2;
  };
in
{
  home = {
    shellAliases = {
      nvim-lazy = "NVIM_APPNAME=LazyVim nvim";
      nvim-kick = "NVIM_APPNAME=kickstart nvim";
      nvim-chad = "NVIM_APPNAME=NvChad nvim";
      nvim-chadpython = "NVIM_APPNAME=nvchad-python nvim";
      nvim-astro = "NVIM_APPNAME=AstroNvim nvim";
      nhTotalSwitch = "nh os switch --verbose && nh home switch --verbose && nh clean all --keep=3 && nix flake archive /home/cdockter/MyNixOS/";
      ls = "lsd --git";
      la = "lsd --long -h --git --all";
      ll = "lsd --long -h --git";
      l = "lsd --long  --git --all";
      cd = "z";
    };
  };
  programs = {
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      dotDir = ".config/zsh";
      syntaxHighlighting.enable = true;
      initExtra = ''
        function nvims() {
          items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
          config=$(printf "%s\\n" "''${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
          if [[ -z $config ]]; then
            echo "Nothing selected"
            return 0
            elif [[ $config == "default" ]]; then
            config=""
          fi
          NVIM_APPNAME=$config nvim $@
        }
        bindkey -s ^a "nvims\\n"
        zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
        zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
        zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
        zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default
        function winfzf() {
          # Use fd to list relevant files and directories in the home directory and below
          local files
          files=$(fd --type f --exclude '*.git*' . --max-depth 3 --print0 | xargs -0 -n 1 basename)

          # Combine items and programs into a single list
          local all_items
          all_items=$(echo -e "$files\n$PATH" | tr ':' '\n' | xargs -I {} fd --type f --exclude '*.git*' --full-path {} --max-depth 1 --print0 | xargs -0 -n 1 basename)

          # Run fzf on the combined list
          local selected
          selected=$(echo -ne "$all_items" | fzf --prompt="Select an item: " --print-query --exit-0 --reverse)

          if [[ -n $selected ]]; then
            echo "Selected item: $selected"
            # Check if selected item is a program in PATH and execute it
            local command_path
            for dir in $(echo $PATH | tr ':' '\n'); do
              if [[ -x "$dir/$selected" ]]; then
                command_path="$dir/$selected"
                break
              fi
            done
            if [[ -n $command_path ]]; then
              echo "Executing: $command_path"
              "$command_path"
            else
              echo "Item '$selected' is not executable or not found in PATH."
            fi
          else
            echo "Nothing selected"
          fi
        }
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "thefuck" "colored-man-pages" "cp" "zoxide" "tmux" "alias-finder" ];
      };
    };
    oh-my-posh = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      # settings = ohMyPoshConfig;
      useTheme = "atomic";
    };
  };
}


