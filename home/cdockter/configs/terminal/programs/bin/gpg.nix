{cdockterSettings, ...}: {
  services.gpg-agent = {
    enable = true;
  };
  programs.gpg = {
    enable = true;
    homedir = "${cdockterSettings.homeDirectory}/.config/gnupg";
  };
}
