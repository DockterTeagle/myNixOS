{pkgs, ...}: {
  imports = [
    ./shell
    ./neovim
  ];
  environment.systemPackages = with pkgs; [
    pstree
    gnumake
    zulu
    obsidian
    # just
    ncdu
  ];
}
