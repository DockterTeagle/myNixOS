{ ... }:
{
  home = {
    shellAliases = {
      nvim-lazy = "NVIM_APPNAME=LazyVim nvim";
      nvim-kick = "NVIM_APPNAME=kickstart nvim";
      nvim-chad = "NVIM_APPNAME=NvChad nvim";
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
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "thefuck" "colored-man-pages" "colorize" "cp" "zoxide" "tmux" ];
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
