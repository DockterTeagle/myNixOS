{
  cdockterSettings,
  pkgs,
  lib,
  ...
}:
{
  programs.tofi = {
    enable = true;
    settings = {
      # launcher = [
      #   {
      #     command = "uwsm app -- {cmd}";
      #   }
      #   {
      #     shell_command = "ghostty --exec {cmd}";
      #   }
      #   {
      #     default_command = "bash -c 'if [[ \"{cmd}\" =~ ^(gnome-terminal|kitty|alacritty|xterm|konsole|foot|wezterm|ghostty)$ ]]; then ghostty --hold {cmd}; else uwsm app -- {cmd}; fi'{cmd}";
      #   }
      # ];
      font = lib.mkForce "${
        pkgs.${cdockterSettings.nerdfont}
      }/share/fonts/truetype/NerdFonts/JetBrainsMono";
    };
  };
}
