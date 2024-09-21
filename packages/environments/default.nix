{ pkgs
, inputs
, mainUserSettings
, conf
, lib
, ...
}:
{
  imports = [
    (
      #this part should somehow be in home-manager
      if mainUserSettings.wm == "hyprland"
      then (import ./hyprland/default.nix { inherit inputs pkgs conf lib; })
      else if mainUserSettings.wm == "sway"
      then (import ./sway/default.nix { inherit inputs pkgs conf lib; })
      else
        (import ./sway/default.nix { inherit inputs pkgs conf lib; })
    )
  ];
  services.greetd = {
    enable = true;
    restart = true;
    package = pkgs.greetd.tuigreet;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
      };
    };
  };

  environment = {
    shellAliases.obs = "env -u WAYLAND_DISPLAY obs";
    systemPackages = with pkgs; [
      cliphist
      # eww
      wl-clipboard
      polkit
      polkit-kde-agent
      libva-utils
      fuseiso
      udiskie
      nvidia-vaapi-driver # move me
      gsettings-desktop-schemas
      swaynotificationcenter
      wlr-randr
      grim
      grimblast
      xdg-utils
      lshw
      waybar
      pavucontrol
      dbus
    ];
  };
}
