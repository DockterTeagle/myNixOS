{ cdockterSettings, ... }:
{
  programs = {
    wayprompt = {
      enable = true;
    };
    git = {
      enable = true;
      delta = {
        enable = true;
      };
      userName = "Dr.Teagle";
      userEmail = cdockterSettings.email;
      signing = {
        format = "openpgp";
        key = "A8F847D060070466";
      };
      extraConfig = {
        core.editor = "nvim";
        init.defaultBranch = "main";
      };
    };
  };
}
