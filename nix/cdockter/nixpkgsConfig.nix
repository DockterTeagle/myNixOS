{ inputs, cell }:
let
  inherit (inputs.nixpkgs) lib;
in
{
  allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-run"
      "steam-original"
      "steam-unwrapped"
      "nvida"
      "nvidia-settings"
      "nvidia-x11"
   "xow_dongle-firmware"   "obsidian"
    ];
}
