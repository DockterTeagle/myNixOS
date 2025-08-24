{ pkgs, ... }:
{
  services.gpg-agent = {
    enable = true;
    pinentry = {
      program = "pinentry-curses";
      package = pkgs.pinentry-curses;
    };
  };
  programs.gpg = {
    enable = true;
  };
}
