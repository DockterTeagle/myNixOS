{
  imports = [
    ./activitywatch.nix
    ./amberol.nix
    ./cliphist.nix
    ./easyeffects.nix
    ./gnome-keyring.nix
    ./hyprpolkitagent.nix
    ./hyprsunset.nix
    ./playerctld.nix
    ./recoll.nix
    ./wl-clip-persist.nix
    ./yubikey-agent.nix
  ];
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };
}
