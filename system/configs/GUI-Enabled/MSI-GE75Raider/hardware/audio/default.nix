# NOTE: Im good
{
  services = {
    pipewire = {
      enable = true;
      extraConfig = {
        pipewire = {
          properties = {
            "default.clock.quantum" = 1024;
            "default.clock.rate" = 48000;
          };
        };
      };

      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
      audio.enable = true;
    };
  };
}
