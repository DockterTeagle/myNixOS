{
  services.home-manager = {
    autoExpire = {
      enable = true;
      frequency = "weekly";
    };

  };
  programs.home-manager = {
    enable = true;
  };
}
