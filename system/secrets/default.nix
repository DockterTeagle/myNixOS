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
}
