{
  programs.topgrade = {
    enable = true;
    settings = {
      misc = {
        assume_yes = true;
        pre_sudo = true;
        sudo_command = "sudo";
        disable = [
          "flutter"
          "node"
          "emacs"
          "nix"
          "system"
          "home_manager"
        ];
        set_title = false;
        cleanup = true;
      };
      commands = {
        # "Run garbage collection on Nix store" = "nh clean all";
        "Update All Nix Flakes" = # bash
          ''
            bash -c 'for flake in $(fd -t f flake.nix ~/ --print0 --exclude .local| xargs -0 -n 1 dirname);do 
                        echo "Updating flake: $flake";
                        nix flake update --flake "$flake" ;
                      done'
          '';
        "Upgrade nixos" = "nh os switch";
        "Upgrade home-manager" = "nh  home switch";
        "Update Lazy.nvim plugins" = # bash
          ''nvim --headless -c ' Lazy! sync ' -c 'qall' '';
      };
    };
  };
}
