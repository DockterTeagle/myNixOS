{pkgs, ...}: {
  programs.neovim = {
    package = pkgs.neovim;
    # package = inputs.nvimconfig.packages.${systemSettings.system}.default;
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
    vimAlias = true;
  };
}
