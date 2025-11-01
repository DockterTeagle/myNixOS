{
  imports = [
    ./cliphist.nix
    ./amberol.nix
    ./recoll.nix
    ./easyeffects.nix
  ];
  services = {
    playerctld.enable = true;
    hyprpolkitagent.enable = true;
    hyprsunset.enable = true;
    yubikey-agent.enable = true;
    wl-clip-persist = {
      enable = true;
    };
  };
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };
}
