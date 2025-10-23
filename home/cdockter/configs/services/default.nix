{
  imports = [
    ./cliphist.nix
    ./mangohud.nix
    ./git-sync.nix
  ];
  services = {
    playerctld.enable = true;
    hyprpolkitagent.enable = true;
    hyprsunset.enable = true;
    wl-clip-persist = {
      enable = true;
    };
  };
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };
}
