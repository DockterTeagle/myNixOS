{cdockterSettings, ...}: {
  programs.gpg = {
    enable = true;
    homedir = "${cdockterSettings.homeDirectory}/.config/gnupg";
  };
}
