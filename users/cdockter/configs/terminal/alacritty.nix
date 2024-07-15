{ ... }:

{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    scrolling.history = 1000;
    font = {
      size = 15.0;
      normal = {
        family = "JetBrains Mono Nerd Font";
        style = "Regular";
      };
      bold = {
        family = "JetBrains Mono Nerd Font";
        style = "Bold";
      };
      italic = {
        family = "JetBrains Mono Nerd Font";
        style = "Italic";
      };
    };
  };
  # programs.alacritty.settings = {
  #   colors = with config.colorScheme.palette; {
  #     bright = {
  #       black = "0x${base00}";
  #       blue = "0x${base0D}";
  #       cyan = "0x${base0C}";
  #       green = "0x${base0B}";
  #       magenta = "0x${base0E}";
  #       red = "0x${base08}";
  #       white = "0x${base06}";
  #       yellow = "0x${base09}";
  #     };
  #     cursor = {
  #       cursor = "0x${base06}";
  #       text = "0x${base06}";
  #     };
  #     normal = {
  #       black = "0x${base00}";
  #       blue = "0x${base0D}";
  #       cyan = "0x${base0C}";
  #       green = "0x${base0B}";
  #       magenta = "0x${base0E}";
  #       red = "0x${base08}";
  #       white = "0x${base06}";
  #       yellow = "0x${base0A}";
  #     };
  #     primary = {
  #       background = "0x${base00}";
  #       foreground = "0x${base06}";
  #     };
  #   };
  # };
}
