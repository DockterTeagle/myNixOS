{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    spotify
    # kdePackages.dolphin
  ];
  imports = [
    ./productivity.nix
    ./security.nix
  ];
}
