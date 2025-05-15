{lib, ...}: {
  programs.vesktop.enable = lib.mkForce false;
  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    config = {
      frameless = true;
      plugins = {
        blurNSFW.enable = true;
        # alwaysAnimate.enable = true;
        # betterFolders = {
        #   enable = true;
        #   closeOthers = true;
        # };
        fakeNitro = {
          enable = true;
        };
        anonymiseFileNames = {
          enable = true;
          anonymiseByDefault = true;
        };
      };
    };
  };
}
