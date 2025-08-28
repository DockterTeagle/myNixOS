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
      biosSupport = true;
      efiSupport = true;
      biosDevice = "/dev/nvme0n1";
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
