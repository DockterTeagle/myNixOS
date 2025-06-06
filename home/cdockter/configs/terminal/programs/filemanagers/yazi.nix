{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    initLua = ./yaziInit.lua;
    plugins = {
      inherit (pkgs.yaziPlugins) git;
    };
    settings = {
      mgr = {
        show_hidden = true;
        sort_by = "natural";
      };
    };
  };
}
