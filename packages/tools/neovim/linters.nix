{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    selene
    ruff
    vale
    write-good
    # valeStyles.write-good
  ];
}
