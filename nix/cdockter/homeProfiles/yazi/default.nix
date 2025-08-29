{
  pkgs,
  inputs,
  ...
}:
{
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.yazi;
    shellWrapperName = "y";
    initLua = ./_yaziInit.lua;
    plugins = {
      inherit (pkgs.yaziPlugins)
        git
        full-border
        mount
        smart-paste
        smart-filter
        starship
        ;
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = "F";
          run = "plugin smart-filter";
          desc = "Smart  Filter";
        }
        {
          on = "M";
          run = "plugin mount";
        }
        {
          on = "p";
          run = "plugin smart-paste";
          desc = "Paste into the hovered dir or CWD";
        }
      ];
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
