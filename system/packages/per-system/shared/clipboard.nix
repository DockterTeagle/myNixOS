{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    clipboard-jh
    xclip
  ];
}
