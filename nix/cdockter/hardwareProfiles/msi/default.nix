{ inputs, cell }:
{
  imports = [
    cell.nixosModules.modules
  ];
}
