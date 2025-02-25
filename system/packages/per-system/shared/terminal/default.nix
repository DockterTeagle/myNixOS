{pkgs, ...}: {
  imports = [
    ./shell
    ./neovim
  ];
  environment.systemPackages = with pkgs; [
    pstree
    obsidian
    # just
    ncdu
  ];
}
