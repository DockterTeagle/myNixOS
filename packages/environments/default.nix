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
    # loginShellInit = ''run_wm'';
    systemPackages = with pkgs; [
      greetd.greetd
      greetd.wlgreet
      cliphist
      eww-wayland
      swww #animated wayland images backgroun
      ags #widgets
      wl-clipboard
      wayland #needed?
      polkit
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
      # wofi #launcher
      grim
      grimblast
      xdg-utils
      lshw
      # qt6.qmake
      # qt6.qtwayland
      # adwaita-qt
      waybar
      # wayland-protocols
      # wayland-utils
      pavucontrol
      wlroots
      # upower #needed since I have tlp??
      # gtkmm3
      dbus
      mako #notification manager
      # rofi-wayland # app launcher like mako
      # (writeShellScriptBin "run_wm" ''
      #   if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
      #   ${(
      #     if mainUserSettings.wm == "sway"
      #     then "exec sway --unsupported-gpu"
      #     else mainUserSettings.wm
      #   )}
      #   fi
      # '')
    ];
  };
}
