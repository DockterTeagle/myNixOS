{
  pkgs,
  config,
  ...
}: {
  services.yubikey-agent.enable = true;
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/cdockter/.config/sops/age/keys.txt";
    secrets = {
      cdockter_password = {
        format = "yaml";
        neededForUsers = true;
      };
      nixAccessTokens = {
        mode = "0440";
        group = config.users.groups.keys.name;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    sops
    age
    yubikey-manager
    gpg-tui
    gnupg
    pinentry-all
  ];
}
