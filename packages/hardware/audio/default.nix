{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    alsa-utils
  ];
  # services = {
  #   pipewire = {
  #     enable = false;
  #     alsa = {
  #       enable = true;
  #       support32Bit = true;
  #     };
  #     pulse.enable = true;
  #     jack.enable = true;
  #   };
  # };
}
