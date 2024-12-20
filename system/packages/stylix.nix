{ pkgs, ... }:
{
  stylix = {
    image = ../../pictures/black-hole-cosmic-3840x2160-19145.jpg;
    enable = true;
    fonts = {
      sizes = {
        terminal = 15;
        # applications = 15;
        desktop = 11;
        popups = 11;
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font ";
      };
    };
    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 24;
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    targets = {
      grub = {
        enable = true;
        useImage = true;
      };
      regreet.enable = true;
      plymouth = {
        enable = true;
        logoAnimated = true;
      };
    };
  };
}
