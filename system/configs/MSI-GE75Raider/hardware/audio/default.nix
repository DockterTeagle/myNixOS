{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lxqt.pavucontrol-qt
  ];
  services = {
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
      audio.enable = true;
    };
  };
}
