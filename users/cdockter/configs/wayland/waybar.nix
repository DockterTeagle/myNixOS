{ ... }:
{
  programs.waybar = {
    style = {
      font-family = "JetBrains Mono Nerd Font";
    };
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [ "wlr/taskbar" ];
        modules-right = [ "tlp" "temperature" ];
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
        };
      };
    };
  };
}
