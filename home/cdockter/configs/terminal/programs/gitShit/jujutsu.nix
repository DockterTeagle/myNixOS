{cdockterSettings, ...}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        inherit (cdockterSettings) email;
        name = "Dr.Teagle";
      };
    };
  };
}
