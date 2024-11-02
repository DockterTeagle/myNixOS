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
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      "bluetooth.disable_ertm=0"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 0;

    blacklistedKernelModules = [ "snd_pcsp" ]; # Consider adding module_blacklist=i915 to this to maybe disable integrated GPU
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = [
      pkgs.linuxPackages_latest.xpadneo
      pkgs.linuxKernel.packages.linux_6_11.msi-ec
    ];
  };
}
