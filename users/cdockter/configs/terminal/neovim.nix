{
  pkgs,
  inputs,
  systemSettings,
  ...
}:
{
  programs.neovim = {
    # package = inputs.nvimconfig.packages.${systemSettings.system}.default;
    # package = pkgs.neovim;
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
  };
}
