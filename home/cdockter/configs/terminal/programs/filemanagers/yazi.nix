{pkgs, ...}: {
  programs.yazi = {
    package = pkgs.yazi;
    enable = true;
    settings = {
      manager = {
        show_hidden = true;
      };
    };
  };
}
