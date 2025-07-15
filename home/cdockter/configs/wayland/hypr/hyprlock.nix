{ config, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      auth = {
        pam = {
          enabled = true;
          module = "hyprlock";
        };
      };
      general = {
        disable_loading_bar = false;
        grace = 1;
        # hide_cursor = true;
        no_fade_in = false;
      };
      label = with config.lib.stylix.colors; [
        #Date
        {
          monitor = "";
          text = "cmd[update:18000000] echo \"<b> \"$(date +'%A, %-d %B %Y')\" </b>\"";
          font_size = 34;
          font_family = "JetBrains Mono Nerd Font 10";
          position = "0, -150";
          halign = "center";
          valign = "top";
          font_color = "rgb(${base03})";
          shadow_passes = 5;
          shadow_size = 10;
        }
        #Time
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b><big> $(date +\"%H:%M:%S\") </big></b>\""; # 24H
          font_size = 94;
          font_family = "JetBrains Mono Nerd Font 10";
          shadow_passes = 5;
          shadow_size = 10;
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
        # label {
        #     monitor =
        #     #clock
        #     text = cmd[update:1000] echo "$TIME"
        #     font_size = 55
        #     font_family = Fira Semibold
        #     position = -100, 70
        #     halign = right
        #     valign = bottom
        # }
        #

        # User
        {
          monitor = "";
          text = "    $USER";
          font_size = 18;
          font_family = "Inter Display Medium";
          position = "0, 100";
          halign = "center";
          valign = "bottom";
          shadow_passes = 5;
          shadow_size = 10;
        }
      ];

      input-field = {
        monitor = " ";
        size = "200, 50";
        outline_thickness = 3;
        dots_size = 0.33;
        dots_spacing = 0.15;
        dots_center = true;
        dots_rounding = -1;
        fade_timeout = 1000;
        fade_on_empty = true;
        placeholder_text = " <i>Input Password...</i>";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        fail_timeout = 1000;
        fail_transition = 300;
        position = "0, 200";
        halign = "center";
        hide_input = false;
        rounding = 40;
        capslock_color = -1;
        numlock_color = -1;
        bothlock_color = -1; # when both locks are active. -1 means don't change outer color (same for above)
        invert_numlock = false; # change color if numlock is off
        swap_font_color = false; # see below
        shadow_passes = 10;
        shadow_size = 20;
        shadow_boost = 1.6;
        valign = "bottom";
      };
    };
  };
}
