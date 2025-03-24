{
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    enableTransience = true;
    settings = import ./settings.nix;
  };
}
