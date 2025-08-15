{ cdockterSettings, inputs', ... }:
{
  programs.jujutsu = {
    enable = true;
    package = inputs'.jj.packages.default;
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
