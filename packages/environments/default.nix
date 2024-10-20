{ pkgs
, inputs
, mainUserSettings
, conf
, lib
, config
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
  # programs.regreet.enable = true;
  services.greetd = {
    enable = true;
    restart = true;
    package = pkgs.greetd.regreet;
    settings = {
      default_session = {
        command = "${pkgs.cage}/bin/cage -s -- ${config.programs.regreet.package}/bin/regreet ";
        user = "greeter";
      };
    };
  };
  stylix = {
    image = ../../users/cdockter/configs/terminal/fastfetch/images/NixOS.png;
    enable = true;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    targets = {
      regreet.enable = true;
      plymouth = {
        enable = true;
        logoAnimated = true;
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
      nvidia-vaapi-driver # move me
      gsettings-desktop-schemas
      # swaynotificationcenter
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
