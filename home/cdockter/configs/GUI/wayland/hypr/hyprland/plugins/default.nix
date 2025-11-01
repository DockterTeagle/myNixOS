{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = with inputs; [
      split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
      # hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
      # hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
    ];
    settings = {
      plugin = {
        # hyprbars = {
        #   bar_text_font = "Rubik, Geist, AR One Sans, Reddit Sans, Inter, Roboto, Ubuntu, Noto Sans, sans-serif";
        #   bar_height = 30;
        #   bar_padding = 10;
        #   bar_botton_padding = 5;
        #   bar_precedence_over_border = true;
        #   bar_part_of_window = true;
        #   bar_color = "rgba(1D1011FF)";
        #   col.text = "rgba(F7DCDEFF)";
        #   hyprbars-button = [
        #     "rgb(F7DCDE), 13, 󰖭, hyprctl dispatch killactive"
        #     "rgb(F7DCDE), 13, 󰖯, hyprctl dispatch fullscreen 1"
        #     "rgb(F7DCDE), 13, 󰖰, hyprctl dispatch movetoworkspacesilent special"
        #   ];
        # };
        split-monitor-workspaces = {
          count = 5;
          keep_focused = 0;
        };
      };
    };
  };
}
