{
  services.home-manager = {
    # autoUpgrade = {
    #   useFlake = true;
    #   flakeDir = "/home/cdockter/Documents/myNixOS";
    # };
    autoExpire = {
      enable = true;
      frequency = "weekly";
    };

  };
  programs.home-manager = {
    enable = true;
  };
}
