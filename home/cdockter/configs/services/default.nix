{
  imports = [
    ./cliphist.nix
    ./mangohud.nix
    ./solaar.nix
    ./git-sync.nix
  ];
  services.playerctld.enable = true;
  programs.ssh = {
    enable = true;
  };
}
