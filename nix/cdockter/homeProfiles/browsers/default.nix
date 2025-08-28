{ inputs, cell }:
{
  imports = [ cell.homeModules.modules ];
  programs.zen-browser = {
    enable = true;
  };
}
