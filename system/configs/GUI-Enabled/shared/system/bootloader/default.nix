{ pkgs, ... }:
{
  boot = {
    plymouth = {
      enable = true;
    };
    loader = {
      limine = {
        enable = true;
        biosSupport = true;
        secureBoot = {
          enable = true;
        };
      };
    };

    initrd.luks.reusePassphrases = false;
    kernelParams = [
      "boot.shell_on_fail"
      "systemd.log_target=console"
      #other stuff
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      "bluetooth.disable_ertm=0"
      "snd-hda-intel.model=auto"
      "snd-hda-intel.probe_mask=1"
      "threadirqs"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
