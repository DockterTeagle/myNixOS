{pkgs, ...}: {
  programs.yazi = {
    package = pkgs.yazi;
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
      };
    };
  };
}
