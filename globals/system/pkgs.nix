{
  inputs,
  systemSettings,
  ...
}:
import inputs.nixpkgs {
  inherit (systemSettings) system;
  config = {
    nvidia.acceptLicense = true;
    allowUnfreePredicate = pkg:
      builtins.elem (inputs.nixpkgs.lib.getName pkg) [
        "nvidia-x11"
        "nvidia-persistenced"
        "nvidia-settings"
        "discord"
        "steam-unwrapped"
        "steam"
        "nvidia_driver"
        "xow_dongle-firmware"
        "obsidian"
        "spotify"
        "intel-ocl"
        "fakespot-fake-reviews-amazon"
        "onetab"
      ];
    allowSubstitutes = false;
  };
  overlays = with inputs; [
    ghostty.overlays.default
    neovim-nightly-overlay.overlays.default
    nh.overlays.default
    yazi.overlays.default
  ];
}
