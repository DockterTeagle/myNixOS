{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = with inputs; [
      # split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
      # hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
      # hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
      hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprfocus
      # hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprscrolling
    ];
    settings = {
      plugin = {
        # hyprscrolling = {
        #
        #   };
        # split-monitor-workspaces = {
        #   count = 5;
        #   keep_focused = 0;
        # };
      };
    };
  };
}
