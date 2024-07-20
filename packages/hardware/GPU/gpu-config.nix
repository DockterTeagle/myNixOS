{ config, lib, pkgs, ... }:
let
  getGpuBusIds = pkgs.callPackage ./get-gpu-bus-ids.nix { };
  gpuBusIds = builtins.readFile "${getGpuBusIds}/gpu-bus-ids";
  parsedgpuBusIds = lib.foldl'
    (acc: line:
      let
        parts = lib.splitString ":" line;
        type = parts [ 0 ];
        busId = parts [ 1 ];
      in
      acc // {
        ${type} = if acc ? ${type} then acc.${type} ++ [ busId ] else [ busId ];
      }
    )
    { }
    (builtins.splitString "\n" gpuBusIds);

in
{
  options.enableGpuBusIdScript = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable a script to fetch the GPU Bus IDs using hwinfo.";
  };
  config = lib.mkIf config.enableGpuBusIdScript {
    environment.systemPackages = [ getGpuBusIds ];
    videoDrivers = [ "nvidia" "intel" ];
    deviceSections = [
      {
        Identifier = "GPU-0";
        BusID = lib.concatStringsSep "," (builtins.splitString "," gpuBusIds);
      }
    ];
  };
  environment.variables.GPU_BUSIDS = gpuBusIds;
}
