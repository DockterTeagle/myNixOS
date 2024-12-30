{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty-direct";
        source = ../../../../pictures/NixOS.png;
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
        "battery"
        "bios"
        "board"
        "break"
        "cpu"
        "cpucache"
        "cpuusage"
        "colors"
        "cursor"
        "display"
        "disk"
        # "de"
        "dns"
        "font"
        "gpu"
        "host"
        "kernel"
        "loadavg"
        "memory"
        "monitor"
        "netio"
        "opencl"
        "opengl"
        "os"
        "packages"
        "physicaldisk"
        "player"
        "processes"
        "publicip"
        "separator"
        "shell"
        "sound"
        "swap"
        "terminal"
        "title"
        "theme"
        "uptime"
        "version"
        "vulkan"
        "wm"
        "wifi"
      ];
    };
  };
}
