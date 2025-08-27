{
  inputs,
  cell,
}:
let
  inherit (cell.common) cdockterSettings;
in
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
