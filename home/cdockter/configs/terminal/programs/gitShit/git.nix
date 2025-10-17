{ cdockterSettings, ... }:
{
  programs = {
    wayprompt = {
      enable = true;
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "Dr.Teagle";
          inherit (cdockterSettings) email;
        };
        core.editor = "nvim";
        init.defaultBranch = "main";
      };
      signing = {
        format = "openpgp";
        key = "A8F847D060070466";
      };
    };

  };
}
