{
  disko.devices = {
    disk = {
      nvme0n1 = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
		boot= {
name = "boot";
size = "1M";
type="EF00";
};
ESP = {name = "ESP";size = "500M"; type = "EF00";content = {
	type = "filesystem"; format = "vfat"; mountpoint = "/boot"; mountoptions = ["umask=077"];};};
luks = {size = "100%"; content = {
	type = "luks"; name = "crypted-ssd"; extraOpenArgs = []; passwordFile = "/tmp/secret-key"; settings = {
allowDiscards = true; crypttabExtraOpts = [ "fido2-deviced=auto" "token-timeout=10" ];};
content = {type = "lvm_pv"; vg = "root_vg";};};};};
          };
        };
      EHDD = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            luks = {
              size = "100%";
              label = "luksEHDD";
              content = {
                type = "luks";
                name = "cryptHDD";
                settings={allowDiscards = true;
crypttabExtraOpts = ["fido2-device=auto" "token-timeout=10"];};
};

                 passwordFile = "/tmp/secret.key";
                content = {
			type = "lvm_pv"; vg = "root_vg";};};};};};
lvm_vg = {root_vg = {type = "lvm_vg";lvs={root={size="100%FREE";content={type="btrfs";extraArgs=["-f"];
subvolumes = {"/root" = {mountpoint = "/"};"/persist" = {mountOptions = ["compress=zstd" "subvol=persist""noatime"];mountpoint = "/persist";};
  "/nix" = {
                  mountOptions = [
                    "compress=zstd"
                    "subvol=nix"
                    "noatime"
                  ];
                  mountpoint = "/nix";
                };
                };
              };
            };
          };
        };
      };
    };
  };
}
