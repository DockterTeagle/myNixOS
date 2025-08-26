{
  services = {
    spotifyd = {
      enable = true;
    };
  };
  programs = {
    ncspot = {
      enable = true;
      settings = {
        shuffle = true;
        gapless = true;
      };
    };
  };
}
