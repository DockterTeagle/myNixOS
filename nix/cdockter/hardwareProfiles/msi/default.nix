{
  inputs,
  modulesPath,
  cell,
}:
{

  imports = [
    cell.nixosModules.modules
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
}
