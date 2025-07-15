{ pkgs, ... }:
{
  imports = [ ./lanzaboote ];
  environment.systemPackages = with pkgs; [ sbctl ];
  boot = {
    plymouth = {
      enable = true;
    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      #silent Boot
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      #other stuff
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      "bluetooth.disable_ertm=0"
      "snd-hda-intel.model=auto"
      "snd-hda-intel.probe_mask=1"
      "threadirqs"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.systemd-boot.consoleMode = "max";

    blacklistedKernelModules = [
      "snd_pcsp"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
