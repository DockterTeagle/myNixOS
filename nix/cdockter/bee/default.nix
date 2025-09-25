{ inputs, cell }:
{
  bee = {
    system = "x86_64-linux";
    pkgs = cell.pkgs;
    home = inputs.home-manager;
  };
}
