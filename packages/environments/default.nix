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
      # else if mainUserSettings.wm == "sway"
      # then (import ./sway/default.nix { inherit inputs pkgs conf lib; })
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
