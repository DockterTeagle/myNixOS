{
  imports = [
    ./cliphist.nix
    ./mangohud.nix
    ./git-sync.nix
  ];
  services.playerctld.enable = true;
  programs.ssh = {
    enable = true;
  };
}
