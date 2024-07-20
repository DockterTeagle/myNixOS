{ hwinfo, stdenv, lib, ... }:

stdenv.mkDerivation {
  name = "get-gpu-bus-ids";
  buildInputs = [ hwinfo ];
  phases = [ "buildPhase" "installPhase" ];
  buildPhase = ''
     hwinfo --gfxcard | awk '
    /Vendor: 0x10de/ {nvidia=1}
    /Vendor: 0x8086/ {intel=1}
    /Vendor: 0x1002/ {amd=1}
    /BusID: / {busid=$2}
    /SubVendor:/ {
      if (nvidia) {print "nvidia:" busid}
      else if (intel) {print "intel:" busid}
      else if (amd) {print "amd:" busid}
      nvidia=intel=amd=0
    }' > $out/gpu-bus-ids.txt
  '';
  outputString = builtins.readFile ./gpu-bus-ids;
}
    

