{
  programs.topgrade = {
    enable = true;
    settings.misc = {
      assume_yes = true;
      pre_sudo = true;
      sudo_command = "sudo";
      disable = [
        "nix"
        "system"
        "home_manager"
        # "clam_av_db"
        # "git_repos"
        # "vim"
      ];
      cleanup = true;
    };
  };
}
