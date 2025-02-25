{pkgs, ...}: {
  environment.systemPackages = with pkgs; [spotify];
  imports = [
    ./productivity.nix
    ./security.nix
  ];
}
