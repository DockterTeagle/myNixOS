{ pkgs, ... }: {
  imports = [
    ./lanzaboote
  ];
  boot = {
    blacklistedKernelModules = [ "snd_pcsp" ]; # Consider adding module_blacklist=i915 to this to maybe disable integrated GPU
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = [ pkgs.linuxPackages_latest.xpadneo ];
    kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" "bluetooth.disable_ertm=0" ];
  };
}
