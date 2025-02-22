{
  inputs,
  systemSettings,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    clearDefaultKeybinds = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    installVimSyntax = true;
    installBatSyntax = true;
    package = inputs.ghostty.packages.${systemSettings.system}.default;
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
