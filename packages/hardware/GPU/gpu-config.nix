{ config, lib, pkgs, ... }:
let
  getGPuBusId = drv:
    lib.mkDerivation {
      name = "get-gpu-bus-id";
      buildInputs = [ pkgs.hwinfo ];
      phases = [ "installPhase" "buildPhase" ];
      installPhase = ''
        echo $export GPU_BUSID=$(hwinfo --gfxcard | grep -Eo 'BusID: [[:alnum:]]+:[[:alnum:]]+:[[:alnum:]]+.[[:alnum:]]+' | head -n 1 | cut -d' ' -f2)" > $out)
      '';
    };
in
{
  config = {
    gpuBusId = {
      defult = "";
      description = "GPU Bus ID obtained form hwinfo";
    };
  };
  config.gpuBusId.enable = true;
  environment.systemPackages = if config.gpuBusId.enable then [ getGPuBusId ] else [ ];
}
