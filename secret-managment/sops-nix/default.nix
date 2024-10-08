{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.sops-nix.packages.${system}.default
  ];
  programs.gnupg = {
    agent = {
      enable = true;
      enableSSHSupport = true;

    };
  };
}
