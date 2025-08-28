{ inputs, cell }:
{
  imports = with inputs; [
    zen-browser.homeModules.twilight
    # stylix.homeModules.stylix
    # sops-nix.homeManagerModule.sops
    nix-index-database.homeModules.nix-index
  ];
}
