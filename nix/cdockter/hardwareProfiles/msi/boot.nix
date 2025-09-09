{ inputs, cell }:
let
  pkgs = inputs.nixpkgs;
in
{
  plymouth = {
    enable = true;
  };
  loader = {
    limine = {
      enable = true;
      efiSupport = true;
      secureBoot = {
        enable = true;
      };
    };
  };

  initrd = {
    luks.reusePassphrases = false;
    availableKernelModules = [
      "xhci_pci"
      "ahci"
      "nvme"
      "usbhid"
      "usb_storage"
      "sd_mod"
      "rtsx_usb_sdmmc"
    ];
  };
  kernelModules = [ "kvm-intel" ];
  extraModulePackages = [ ];
  kernelPackages = pkgs.linuxPackages_latest;
}
