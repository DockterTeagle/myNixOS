{
  pkgs,
  inputs,
  cdockterSettings,
  conf,
  lib,
  # config,
  ...
}:
{
  imports = [
    (
      #this part should somehow be in home-manager
      if cdockterSettings.wm == "hyprland" then
        (import ./hyprland/default.nix {
          inherit
            inputs
            pkgs
            conf
            lib
            ;
        })
      else if cdockterSettings.wm == "sway" then
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
      package = pkgs.greetd.regreet;
      # settings = {
      #   default_session = {
      #     command = "${pkgs.cage}/bin/cage -s -- ${config.programs.regreet.package}/bin/regreet ";
      #     # user = "greeter";
      #   };
      # };
    };
  };
  environment = {
    systemPackages = with pkgs; [
      cliphist
      polkit
      polkit-kde-agent
      yazi
      kdePackages.qtwayland
      kdePackages.dolphin # fileManager
      kdePackages.qtsvg
      kdePackages.kio-fuse
      kdePackages.kio-extras
      libva-utils
      fuseiso
      udiskie
      gsettings-desktop-schemas
      wlr-randr
      xdg-utils
      lshw
      pavucontrol
      dbus
    ];
  };
}