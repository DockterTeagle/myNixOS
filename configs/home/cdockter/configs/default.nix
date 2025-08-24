{
  imports = [
    ./services
    ./GUI
    ./terminal
    ./XDG
    ./stylix.nix
    ./vars.nix
  ];
  home.pointerCursor = {
    hyprcursor = {
      enable = true;
      size = 24;
    };
  };
}
