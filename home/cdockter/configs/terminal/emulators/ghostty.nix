{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    clearDefaultKeybinds = true;
    installVimSyntax = true;
    installBatSyntax = true;
    package = pkgs.ghostty;
    settings = {
      gtk-titlebar = false;
      window-decoration = false;
      mouse-hide-while-typing = true;
      confirm-close-surface = false;
      async-backend = "epoll";
      keybind = [
        "ctrl+shift+v=paste_from_clipboard"
        "ctrl+shift+c=copy_to_clipboard"
      ];
    };
  };
}
