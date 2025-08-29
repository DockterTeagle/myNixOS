{
  inputs,
  cell,
  config,
}:
let
  pkgs = inputs.nixpkgs;
in
{
  imports = [ cell.nixosProfiles.sops ];
  users.users.cdockter = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "Dockter";
    hashedPasswordFile = config.sops.secrets.cdockter_password.path;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
    ];
  };
}
