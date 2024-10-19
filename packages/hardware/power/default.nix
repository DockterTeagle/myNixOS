{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    brightnessctl
    inotify-tools
    # mcontrolcenter
  ];
  services = {
    tlp = {
      enable = true;
      settings = {
        BluetoothPowerSave = 0;
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 40;
        CPU_BOOST_ON_BAT = 0;
        CPU_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;
        # optional: helps save long-term battery health
        START_CHARGE_THRESH_BAT1 = 40; # 40 and below it starts to charge
        STOP_CHARGE_THRESH_BAT1 = 60; # 80 and above it stops charging
      };
    };
    thermald.enable = true;
  };
}
