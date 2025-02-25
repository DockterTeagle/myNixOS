{
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/cdockter/.config/sops/age/keys.txt";
    secrets = {
      sshkey = {
        path = "/home/cdockter/.ssh/id_ed25519";
      };
    };
  };
}
