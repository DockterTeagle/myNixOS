{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    brightnessctl
    inotify-tools
    mcontrolcenter
  ];
  services = {
    power-profiles-daemon.enable = lib.mkForce false;
    tlp = {
      enable = true;
      settings = {
        RUNTIME_PM_ENABLE = "01:00.0";
        BluetoothPowerSave = 0;
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
        PLATFORM_PROFILE_ON_AC = "balanced";
        PLATFORM_PROFILE_ON_BAT = "low-power";
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 40;
        CPU_BOOST_ON_BAT = 0;
        CPU_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        # optional: helps save long-term battery health
        START_CHARGE_THRESH_BAT1 = 40; # 40 and below it starts to charge
        STOP_CHARGE_THRESH_BAT1 = 80; # 80 and above it stops charging
        INTEL_GPU_MIN_FREQ_ON_BAT = 300;
        INTEL_GPU_MIN_FREQ_ON_AC = 500;
        INTEL_GPU_MAX_FREQ_ON_BAT = 1000;
        INTEL_GPU_MAX_FREQ_ON_AC = 1150;
        INTEL_GPU_BOOST_FREQ_ON_AC = 1150;
        INTEL_GPU_BOOST_FREQ_ON_BAT = 1150;
      };
    };
    thermald.enable = true;
  };
}
