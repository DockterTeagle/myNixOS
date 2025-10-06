{inputs',...}:
{
  programs.ghostty = {
    enable = true;
    package = inputs'.ghostty.packages.default;
    clearDefaultKeybinds = true;
    installVimSyntax = true; # needed?
    installBatSyntax = true; # needed?
    settings = {
      gtk-titlebar = false;
      window-decoration = false;
      mouse-hide-while-typing = true;
      confirm-close-surface = false;
      # command = "tmux attach"; # change to sesh somehow
      keybind = [
        "ctrl+shift+v=paste_from_clipboard"
        "ctrl+shift+c=copy_to_clipboard"
      ];
    };
  };
}
