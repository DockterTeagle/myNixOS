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
    package = inputs.ghostty.packages.${systemSettings.system}.default.overrideAttrs (old: {
      preBuild =
        (old.preBuild or "")
        +
          #bash
          ''
            # use Epoll due to io_uring spamming iowait
            shopt -s globstar
            sed -i 's/^const xev = @import("xev");$/const xev = @import("xev").Epoll;/' **/*.zig
            shopt -u globstar
          '';
    });
    settings = {
      gtk-titlebar = false;
      window-decoration = false;
      mouse-hide-while-typing = true;
      confirm-close-surface = false;
    };
  };
}
