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
      if mainUserSettings.wm == "hyprland"
      then (import ./hyprland/default.nix { inherit inputs pkgs conf lib; })
      else if mainUserSettings.wm == "sway"
      then (import ./sway/default.nix { inherit inputs pkgs conf lib; })
      else
        (import ./sway/default.nix { inherit inputs pkgs conf lib; })
    )
  ];
  environment = {
    shellAliases.obs = "env -u WAYLAND_DISPLAY obs";
    # loginShellInit = ''run_wm'';
    systemPackages = with pkgs; [
      wl-clipboard
      wayland
      obs-studio
      polkit-kde-agent
      libva-utils
      fuseiso
      udiskie
      nvidia-vaapi-driver
      gsettings-desktop-schemas
      swaynotificationcenter
      wlr-randr
      ydotool
      wl-clipboard
      wofi
      swww
      grim
      xdg-utils
      lshw
      qt5.qtwayland
      qt6.qmake
      qt6.qtwayland
      adwaita-qt
      adwaita-qt6
      waybar
      wayland-protocols
      wayland-utils
      pavucontrol
      wlroots
      upower
      gtkmm3
      dbus
      mako #notification manager
      rofi-wayland
      (writeShellScriptBin "run_wm" ''
        if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
        ${(
          if mainUserSettings.wm == "sway"
          then "exec sway --unsupported-gpu"
          else mainUserSettings.wm
        )}
        fi
      '')
    ];
  };
}
