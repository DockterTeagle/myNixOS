{
  programs.neovim = {
    # package = inputs.nvimconfig.packages.${systemSettings.system}.default;
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
  };
}
