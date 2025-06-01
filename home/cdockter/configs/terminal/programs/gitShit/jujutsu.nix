{cdockterSettings, ...}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      git = {
        sign-on-push = true;
      };
      signing = {
        behavior = "drop";
        backend = "gpg";
        backends.program = "gpg2";
      };
      user = {
        inherit (cdockterSettings) email;
        name = "Dr.Teagle";
      };
    };
  };
}
