{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    settings = {
      manager = {
        show_hidden = true;
      };
    };
  };
}
