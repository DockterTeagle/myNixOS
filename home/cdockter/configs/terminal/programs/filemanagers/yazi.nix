{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    initLua = ./yaziInit.lua;
    plugins = {
      inherit (pkgs.yaziPlugins) git full-border;
    };
    settings = {
      plugin.prepend_fetchers = [
        {
          id = "git";
          name = "*";
          run = "git";
        }
        {
          id = "git";
          name = "*/";
          run = "git";
        }
      ];
      mgr = {
        show_hidden = true;
        sort_by = "natural";
      };
    };
  };
}
