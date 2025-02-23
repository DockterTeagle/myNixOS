{
  inputs,
  pkgs,
  systemSettings,
  ...
}: {
  programs.ags = {
    enable = true;
    configDir = ./ags;
    extraPackages = with pkgs; [
      gtksourceview5
      webkitgtk_6_0
      accountsservice
      inputs.ags.packages.${systemSettings.system}.apps
      inputs.ags.packages.${systemSettings.system}.auth
      inputs.ags.packages.${systemSettings.system}.battery
      inputs.ags.packages.${systemSettings.system}.bluetooth
      inputs.ags.packages.${systemSettings.system}.greet
      inputs.ags.packages.${systemSettings.system}.hyprland
      inputs.ags.packages.${systemSettings.system}.mpris
      inputs.ags.packages.${systemSettings.system}.network
      inputs.ags.packages.${systemSettings.system}.notifd
      inputs.ags.packages.${systemSettings.system}.powerprofiles
      inputs.ags.packages.${systemSettings.system}.tray
      inputs.ags.packages.${systemSettings.system}.wireplumber
    ];
  };
}
