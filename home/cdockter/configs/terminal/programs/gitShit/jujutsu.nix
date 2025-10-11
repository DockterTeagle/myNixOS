{ cdockterSettings, ... }:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      git = {
        sign-on-push = true;
      };
      aliases = {
        "push" = [
          "util"
          "exec"
          "--"
          "bash"
          "-c"
          "pre-commit run --hook-stage push && jj git push"
        ];
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
