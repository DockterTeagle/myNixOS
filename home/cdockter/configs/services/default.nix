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
  };
  programs.ssh = {
    enable = true;
  };
}
