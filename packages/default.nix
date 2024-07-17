{ ... }:
{
  imports = [
    ./GUI
    ./environments
    ./hardware
    # ./network #This module is scary
    ./security
    ./system
    ./tools/neovim.nix
    ./yetToBeCategorized
  ];
}
