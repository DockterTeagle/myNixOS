{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs;
    [
      inputs.agenix.packages.${system}.default
    ];
}