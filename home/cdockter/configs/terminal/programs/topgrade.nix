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
          "clam_av_db"
          "git_repos"
          "vim"
        ];
        set_title = false;
        cleanup = true;
      };
      linux = {};
      commands = {
        # "Run garbage collection on Nix store" = "nh clean all";
        "Update All Nix Flakes" =
          # bash
          ''
                  bash -c 'fd -t f --hidden flake.nix ~/ --print0 --exclude .local | xargs -0 -P 4 -I {} bash -c "
                dir=\$(dirname \"{}\");
                echo \"Updating flake in directory: \$dir\";
                nix flake update --flake \"\$dir\" || true
            "'
          '';
        "Upgrade NixOS" =
          # bash
          ''nh os switch'';
        "Upgrade home-manager" =
          # bash
          ''nh  home switch'';
        "Update Lazy.nvim plugins" =
          # bash
          ''
            nvim --headless -c " Lazy! sync " -c "qall"
          '';
      };
    };
  };
}
