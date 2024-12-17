{
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];
  environment.systemPackages = with pkgs; [ sops ];
  # sops = {
  #   defaultSopsFile = ./secrets.yaml;
  #   defaultSopsFormat = "yaml";
  #   age.keyFile = "/home/cdockter/.config/sops/age/keys.txt";
  #   secrets.example-key = { };
  # };
  # programs.gnupg = {
  #   agent = {
  #     enable = true;
  #     enableSSHSupport = true;
  #
  #   };
  # };
}
