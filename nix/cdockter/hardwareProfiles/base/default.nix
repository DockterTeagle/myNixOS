{ inputs, ... }:
#TODO: Do i belong here?
{
  imports = with inputs; [
    nix-gaming.nixosModules.pipewireLowLatency
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
      lowLatency.enable = true;
    };
  };
}
