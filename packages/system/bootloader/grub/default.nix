_:
{
  boot.loader = {
    timeout = null;
    efi.canTouchEfiVariables = false;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = false;
      useOSProber = true;
    };
    #TODO: Understand all of these options
  };
}
