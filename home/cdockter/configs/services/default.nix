{
  imports = [
    ./activitywatch.nix
    ./cliphist.nix
    ./mangohud.nix
    ./solaar.nix
    ./git-sync.nix
  ];
  programs.ssh = {
  enable = true;};
}
