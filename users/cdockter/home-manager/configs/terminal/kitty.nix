{ pkgs, config, ... }:
{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    font.name = "JetBrains Mono Nerd Font";
    font.size = 15;
    # keybindings = {
    #   "alt+v" = "paste_from_clipboard";
    #   "alt+c" = "copy_to_clipboard";
    # };
    settings = {
      "background_opacity" = 1;
      "confirm_os_window_close" = 0;
      "enable_audio_bell" = "no";
    };
    theme = "Catppuccin-Mocha";
  };

}
