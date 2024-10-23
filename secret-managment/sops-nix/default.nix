{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
  ];
  programs.gnupg = {
    agent = {
      enable = true;
      enableSSHSupport = true;

    };
  };
}
