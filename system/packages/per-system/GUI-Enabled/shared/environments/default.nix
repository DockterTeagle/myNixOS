{
  pkgs,
  inputs,
  cdockterSettings,
  conf,
  lib,
  # config,
  ...
}: {
  imports = [
    (
      #TODO:this part should somehow be in home-manager
      if cdockterSettings.wm == "hyprland"
      then
        (import ./hyprland/default.nix {
          inherit
            inputs
            pkgs
            conf
            lib
            ;
        })
      else if cdockterSettings.wm == "sway"
      then
        (import ./sway/default.nix {
          inherit
            inputs
            pkgs
            conf
            lib
            ;
        })
      else
        (import ./sway/default.nix {
          inherit
            inputs
            pkgs
            conf
            lib
            ;
        })
    )
  ];
  programs.regreet = {
    enable = true;
    cageArgs = [
      "-s"
      "-m"
      "last"
    ];
    settings = {
      commands = {
        reboot = [
          "systemctl"
          "reboot"
        ];
        poweroff = [
          "systemctl"
          "poweroff"
        ];
      };
      appearance = {
        greeting_msg = "Welcome back!";
      };
    };
  };
  services = {
    playerctld.enable = true;
    greetd = {
      enable = true;
      restart = true;
    };
  };
  environment = {
    systemPackages = with pkgs; [
      cliphist
      polkit
      libva-utils
      fuseiso
      lshw
      pavucontrol
    ];
  };
}
