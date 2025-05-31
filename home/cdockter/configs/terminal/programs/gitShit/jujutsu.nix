{cdockterSettings, ...}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      git = {
        sign-on-push = true;
      };
      signing = {
        behavior = "own";
        backend = "gpg";
      };
      user = {
        inherit (cdockterSettings) email;
        name = "Dr.Teagle";
      };
    };
  };
}
