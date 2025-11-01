{
  imports = [
    ./hypridle.nix
    ./hyprlauncher.nix
    ./hyprlock.nix
    ./hyprpanel.nix
    # ./hyprshell.nix
    ./hyprland
  ];
  home.pointerCursor = {
    hyprcursor = {
      enable = true;
      size = 24;
    };
  };
}
