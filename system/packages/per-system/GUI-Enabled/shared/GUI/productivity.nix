{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    onlyoffice-bin_latest
  ];
  services.solaar = {
    enable = true;
    batteryIcons = "solaar";
    window = "hide";
  };
}
