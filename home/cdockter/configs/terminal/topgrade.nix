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
          "system"
          "home_manager"
        ];
        set_title = false;
        cleanup = true;
      };
      commands = {
        # "Run garbage collection on Nix store" = "nh clean all";
        "Update All Nix Flakes" = # bash
          "for flake in $(fd -t f flake.nix ~/ --print0| xargs -0 -n 1 dirname);do 
            echo \"Updating flake: $flake\"
            nix flake update --flake \"$flake\" 
          done
          ";
        "Upgrade nixos" = "nh os switch";
        "Upgrade home-manager" = "nh  home switch";
      };
    };
  };
}
