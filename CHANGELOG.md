# CHANGELOG/RESOLVED TODOS

- [x] config hyprpaper or swww
  - using stylix
- [x] config mako
  - using hyprpanel for now
- [x] sort remaining packages in zsh.nix and configuration.nix into their
  respective packages
- [x] find a way to only have one version of hyprland installed as currently
  there is two, one in home and one in system
  - fixed by setting to null in home-manager
- [x] make hyprland have tmux like leader key
  - fixed awhile ago
- [x] wait for ghostty to fix cpu error
- [x] check if transient prompt is possible in starship and if it is enable it
  - only possible with fish
- [x] move basically all of tools into their own separate flakes
- [x] configure this to set WSL auto
  - not exactly done yet, but is satisfactory for now
- [x] fix hyprlock crashing
  - fixed by commenting out commands that dont work
- [x] refactor into system/systems and system/packages
- [x] make an indicator to tell when in prefix/ special mode for Hyprland,
  also make it execute only one command at a time unless told to. Also
  make all binds have docs and a help key
  - done through hyprpanel
