{
  pkgs,
  inputs,
  mainUserSettings,
  conf,
  lib,
  config,
  ...
}:
{
  imports = [
    (
      #this part should somehow be in home-manager
      if mainUserSettings.wm == "hyprland" then
        (import ./hyprland/default.nix {
          inherit
            inputs
            pkgs
            conf
            lib
            ;
        })
      else if mainUserSettings.wm == "sway" then
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
  services.greetd = {
    enable = true;
    restart = true;
    package = pkgs.greetd.regreet;
    settings = {
      default_session = {
        command = "${pkgs.cage}/bin/cage -s -- ${config.programs.regreet.package}/bin/regreet ";
        # user = "greeter";
      };
    };
  };
  environment = {
    shellAliases.obs = "env -u WAYLAND_DISPLAY obs";
    systemPackages = with pkgs; [
      # cliphist
      # eww
      wl-clipboard
      polkit
      polkit-kde-agent
      kdePackages.dolphin
      libva-utils
      fuseiso
      udiskie
      gsettings-desktop-schemas
      wlr-randr
      grim
      grimblast
      xdg-utils
      lshw
      # waybar
      pavucontrol
      dbus
    ];
  };
}
