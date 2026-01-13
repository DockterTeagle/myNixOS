{ inputs, ... }:
{
  imports = [ inputs.noctalia.homeModules.default ];
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
    plugins = {
      states = {
        # keybind-cheatsheet = {
        #   enabled = true;
        #   sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        # };
      };
    };
    settings = {
      bar = {
        position = "top";
        density = "spacious";
      };
    };
  };
}
