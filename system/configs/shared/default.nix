{
  imports = [
    ./environments
    ./network
    ./security
    ./bootloader
    ./services
    ./gaming.nix
    ./systemMonitors.nix
  ];
  programs.dconf.enable = true;
}
