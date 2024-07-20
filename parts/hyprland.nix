{ self, lib, ... }:
{
  perSystem = { config, self', inputs', pkgs, ... }:
    {
      hyprland.url = "github:hyprwm/Hyprland";
      hyprland-plugins = {
        url = "github:hyprwm/hyprland-plugins";
        inputs.hyprland.follows = "hyprland";
      };
    };
}
