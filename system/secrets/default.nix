{ pkgs, ... }:
{
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/cdockter/.config/sops/age/keys.txt";
    secrets = {
      cdockter_password = {
        format = "yaml";
        neededForUsers = true;
      };
    };
  };
  services.yubikey-agent.enable = true;
  programs = {
    yubikey-manager.enable = true;
  };
  #NOTE: NONE OF ME ARE MODULES --check date 08/22/25
  environment.systemPackages = with pkgs; [
    sops
    disko
    age
  ];
}
