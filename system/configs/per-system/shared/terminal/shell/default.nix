{pkgs, ...}: {
  fonts.fontconfig.enable = true;
  environment.systemPackages = with pkgs; [
    unzip
    zip
    lazygit
    zathura
    # vim-full
    feh
  ];
}
