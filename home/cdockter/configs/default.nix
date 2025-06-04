{
  imports = [
    ./services
    ./GUI
    ./wayland
    ./terminal
    ./stylix.nix
  ];
  home.pointerCursor = {
    hyprcursor = {
      enable = true;
      size = 24;
    };
  };
}
