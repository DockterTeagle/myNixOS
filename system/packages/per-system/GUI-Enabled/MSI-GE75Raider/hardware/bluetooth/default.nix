{pkgs, ...}: {
  hardware = {
    bluetooth = {
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
      enable = true;
    };
  };
  services = {
    pulseaudio.enable = false;
    blueman.enable = true;
    udev.packages = [pkgs.evtest];
    pipewire = {
      wireplumber.extraConfig.bluetoothEnhancements = {
        "monitor.bluez.properties" = {
          # Enable advanced codecs
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-lc3" = true;

          # Hardware volume and roles
          "bluez5.enable-hw-volume" = true;
          "bluez5.roles" = [
            "hsp_hs"
            "hsp_ag"
            "hfp_hf"
            "hfp_ag"
            "a2dp_sink"
            "a2dp_source"
          ];

          # Codec prioritization
          "bluez5.codec-priority" = [
            "ldac"
            "aptx_hd"
            "aptx"
            "aac"
            "sbc_xq"
            "sbc"
          ];
        };
      };
    };
  };
  environment.systemPackages = with pkgs; [
    bluez
    bluez-alsa
    bluez-tools
  ];
}
