{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bibtex-tidy
  ];
}
