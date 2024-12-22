{
  programs.waybar = {
    enable = true;
    style =
      #css
      ''
        * {
          font-family : "JetBrains Mono Nerd Font";
          font-size : 16px;
          min-height : 1px;
        }
        window#waybar {
          background: transparent;
        }
        #workspaces button {
          background: transparent;
          color: #0d74bd;
        }

        #cpu,   #temperature, #disk,   #pulseaudio, #bluetooth,  #battery,  #network, #workspaces,#custom-gpu {
          background-color: transparent;
          color: #00ba69;
          margin-top: 15px;
          padding-left: 10px;
          padding-right: 10px;
          margin-right: 15px;
        }

        #custom-gpu  {
          color: #82aaff;
        }
        #workspaces {
          background-color: transparent;
          color: #0d74bd;
        }
        #network {
          background-color: transparent;
          color: #82aaff;
        }
        #cpu {
          color: #FFD700;
        }

        #memory {
          color: #008000;
          margin-top: 15px;
          padding-left: 10px;
          padding-right: 10px;
          margin-right: 15px;
        }

        #disk {
          color: #A8A8A8;

        }

         #bluetooth {
          color: #0056A3;
          padding-right: 5px;
          margin-right: 0
        }

        #pulseaudio {
          color: #ba23d9;
          padding-left: 5px;
        }

      '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 56;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [
          "cpu"
          "custom/gpu"
          "memory"
          "disk"
        ];
        modules-right = [
          "temperature"
          "network"
          "pulseaudio"
          # "battery"
          "bluetooth"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          on-click = "nm-connection-editor";
        };
        temperature = {
          critical-threshold = 100;
          format-critical = "{icon} {temperatureC} °C";
          format = "{icon} {temperatureC} °C";
          format-icons = [
            ""
            ""
            ""
          ];
          interval = 2;
        };
        "hyprland/workspaces" = {
          format = "{name} {icon}";
          tooltip = false;
          all-outputs = true;
          format-icons = {
            active = " ";
            default = " ";
          };
          on-click = "activate";
        };
        "custom/gpu" = {
          exec = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits";
          format = "GPU: {}%";
          all-outputs = true;
          interval = 1;
        };
        cpu = {
          format = "󰻠 {usage}%";
          tooltip = true;
          on-click = "kitty sh -c 'btop'";
          interval = 2;
        };
        memory = {
          format = " {}%";
          tooltip = true;
          on-click = "kitty sh -c 'btop'";
          interval = 2;
        };
        disk = {
          format = "  {percentage_used}% ({free})";
          tooltip = true;
          interval = 2;
          on-click = "kitty sh -c 'yazi'";
        };
        # clock = {
        #   format = "  {:%d <small>%a</small> %H:%M}";
        #   format-alt = "  {:%A %B %d %Y (%V) | %r}";
        #   tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        #   calendar-weeks-pos = "right";
        #   today-format = "<span color='#f38ba8'><b><u>{}</u></b></span>";
        #   format-calendar = "<span color='#f2cdcd'><b>{}</b></span>";
        #   format-calendar-weeks = "<span color='#94e2d5'><b>W{:%U}</b></span>";
        #   format-calendar-weekdays = "<span color='#f9e2af'><b>{}</b></span>";
        #   interval = 1;
        # };
        backlight = {
          devicxe = "intel_backlight";
          format = "<span color='#2da14c'>{icon}</span> {percent}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          on-scroll-up = "brightnessctl set +2%";
          on-scroll-down = "brightnessctl set 2%-";
          interval = 2;
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}%";
          format-bluetooth-muted = "󰗿 ";
          format-muted = " ";
          format-source = "{volume}% ";
          format-source-muted = " ";
          format-icons = {
            headphone = "󰋋 ";
            headset = "󰋎 ";
            phone = " ";
            car = " "; # tf?
            default = [
              ""
              " "
              " "
            ];
          };
          on-click = "pavucontrol";
        };
        bluetooth = {
          format = "<span color='#0056A3'></span> {status}";
          format-disabled = "";
          format-connected = "<span color='#0056A3'></span> {num_connections}";
          tooltip-format = "{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}  {device_address}";
          on-click = "blueman-manager";
        };
      };
      battery = {
        states = {
          good = 100;
          warning = 30;
          critical = 20;
        };
        format = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        format-plugged = " {capacity}%";
        format-alt = "{icon} {time}";
        format-full = " {capacity}%";
        format-icons = [
          " "
          " "
          " "
          " "
          " "
          " "
        ];
        # format-charging = "<span color='#2da14c'> </span> {capacity}%";
        interval = 2;
      };
    };
  };
}
