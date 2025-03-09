# {
#   # inputs,
#   # cdockterSettings,
# }:
{
  imports = [
    ./animations
    ./binds
    ./decorations
    ./windows
    ./general.nix
    ./autostart.nix
    ./windowrules.nix
  ];
  # wayland.windowManager.hyprland = {
  #   plugins = with inputs; [
  #     hy3.packages.x86_64-linux.hy3
  #   ];
  # };
}
