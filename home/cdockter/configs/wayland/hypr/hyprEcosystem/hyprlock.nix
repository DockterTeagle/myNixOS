{pkgs, ...}: {
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;
    settings = {
      general = {
        disable_loading_bar = false;
        grace = 1;
        # hide_cursor = true;
        no_fade_in = false;
      };
      background = [{monitor = " ";}];
      label = [
        #Date
        {
          monitor = "";
          text = "cmd[update:18000000] echo \"<b> \"$(date +'%A, %-d %B %Y')\" </b>\"";
          font_size = 34;
          font_family = "JetBrains Mono Nerd Font 10";
          position = "0, -150";
          halign = "center";
          valign = "top";
        }
        # Week
        {
          monitor = "";
          text = "cmd[update:18000000] echo \"<b> \"$(date +'Week %U')\" </b>\"";
          font_size = 24;
          font_family = "JetBrains Mono Nerd Font 10";
          position = "0, -250";
          halign = "center";
          valign = "top";
        }
        #Time
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b><big> $(date +\"%H:%M:%S\") </big></b>\""; # 24H
          font_size = 94;
          font_family = "JetBrains Mono Nerd Font 10";

          position = "0, 0";
          halign = "center";
          valign = "center";
        }
        # User
        {
          monitor = "";
          text = "    $USER";
          font_size = 18;
          font_family = "Inter Display Medium";
          position = "0, 100";
          halign = "center";
          valign = "bottom";
        }

        #
        # # uptime
        # label {
        #     monitor =
        #     text = cmd[update:60000] echo "<b> "$(uptime -p || $Scripts/UptimeNixOS.sh)" </b>"
        #     color = $color12
        #     font_size = 24
        #     font_family = JetBrains Mono Nerd Font 10
        #     position = 0, 0
        #     halign = right
        #     valign = bottom
        # }
        # }
      ];
      input-field = [
        {
          monitor = " ";
          size = "200, 50";
          outline_thickness = 3;
          dots_size = 0.33;
          dots_spacing = 0.15;
          dots_center = true;
          dots_rounding = -1;
          outer_color = "rgb(151515)";
          inner_color = "rgb(200, 200, 200)";
          font_color = "rgb(10, 10, 10)";
          fade_timeout = 1000;
          fade_on_empty = true;
          placeholder_text = " <i>Input Password...</i>";
          rounding = -1;
          check_color = "rgb(204, 136, 34)";
          fail_color = "rgb(204, 34, 34)";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          # fail_timeout = 2000;
          fail_transition = 300;
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1;
          position = "0, 200";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
