{ inputs, ... }:
let
  nixosSettings = import ./nixosSettings.nix;
  nixosWSLSettings = nixosSettings // {
    hostName = "NixOS-WSL";
    WSL = true;
  };

  # Determine the profile: if the environment variable is empty, default to "nixos"
  profile =
    let
      p = builtins.getEnv "NIXOS_POFILE";
    in
    if p != "" then p else "nixos";
  systemSettings = if profile == "wsl" then nixosWSLSettings else nixosSettings;
  pkgs = import ./pkgs.nix { inherit inputs systemSettings; };
in
{
  inherit systemSettings pkgs;
}
