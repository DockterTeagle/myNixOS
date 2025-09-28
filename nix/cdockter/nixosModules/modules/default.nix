{
  inputs,
}:
{
  imports = with inputs; [
    solaar.nixosModules.default
    disko.nixosModules.disko
    sops-nix.nixosModules.default
  ];
}
