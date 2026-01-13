{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    input = {
      General = {
        UserspaceHID = false;
        ClassicBondedOnly = false;
      };
    };
    settings = {
      General = {
        Experimental = true;
      };
    };
  };
  services = {
    pulseaudio.enable = false;
    blueman.enable = true;
  };
}
