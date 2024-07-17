{ ... }:
{
  home = {
    shellAliases = {
      nvim-lazy = "NVIM_APPNAME=LazyVim nvim";
      nvim-kick = "NVIM_APPNAME=kickstart nvim";
      nvim-chad = "NVIM_APPNAME=NvChad nvim";
      nvim-chadpython = "NVIM_APPNAME=nvchad-python nvim";
      nvim-astro = "NVIM_APPNAME=AstroNvim nvim";

      ls = "eza";
      la = "eza --long --group -h --git --all";
      ll = "eza --long --group -h --git";
      l = "eza --long --group -h --git --all";
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
      # settings = {
      # };
      useTheme = "atomic";
      #TODO: Enable transient Prompt, and change the widgets to not show the default shell, make it more like p10k.
    };
  };
}


