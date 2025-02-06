{
  programs.starship = {
    enableNushellIntegration = true;
    enable = true;
    enableTransience = true;
    settings = import ./settings.nix;
  };
}
