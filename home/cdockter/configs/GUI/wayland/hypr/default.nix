{
  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprland
  ];
  home.pointerCursor = {
    hyprcursor = {
      enable = true;
      size = 24;
    };
  };
}
