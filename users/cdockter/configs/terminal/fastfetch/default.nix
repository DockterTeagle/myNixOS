{...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty-direct";
        source = ../../../../../pictures/NixOS.png;
        # padding = {
        #   right = 1;
        # };
      };
      display = {
        temp = {
          ndigits = 8;
        };
        stat = true;
        showErrors = true;
        percent = {
          type = 3;
          ndigits = 3;
        };
        # bar = {
        #
        # };
        size = {
          binaryPrefix = "si";
        };
        color = "blue";
        separator = "  ";
      };
      general = {
        multithreading = true;
      };
      modules = [
        {
          type = "datetime";
          key = "Date";
          format = "{1}-{3}-{11}";
        }
        {
          type = "datetime";
          key = "Time";
          format = "{14}:{17}:{20}";
        }
        # "battery"
        "bios"
        # "bluetooth"
        "board"
        "bootmgr"
        "break"
        # "brightness"
        # "camera"
        # "chassis"
        "cpu"
        "cpucache"
        "cpuusage"
        "command"
        "colors"
        "cursor"
        "display"
        "disk"
        "diskio"
        # "de"
        "dns"
        "editor"
        "font"
        "gamepad"
        "gpu"
        "host"
        "icons"
        "initsystem"
        "kernel"
        "lm"
        "loadavg"
        "localip"
        "media"
        "memory"
        "monitor"
        "netio"
        "opencl"
        "opengl"
        "os"
        "packages"
        "physicaldisk"
        "physicalmemory"
        "player"
        # "poweradapter"
        "proccesses"
        "publicip"
        "seperator"
        "shell"
        "sound"
        "swap"
        "terminal"
        "terminalfont"
        "terminalsize"
        "terminaltheme"
        "title"
        "theme"
        "uptime"
        "users"
        "version"
        "vulkan"
        "wallpaper"
        "wm"
        "wifi"
        "wmtheme"
        "zpool"
      ];
    };
  };
}
