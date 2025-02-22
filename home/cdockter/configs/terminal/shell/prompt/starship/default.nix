{
  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = import ./settings.nix;
  };
}
