{
  imports = [
    ./services
    ./GUI
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
