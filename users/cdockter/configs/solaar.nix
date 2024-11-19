_: {
  home.file = {
    ".config/solaar/config.yaml".text = ''divert-keys: {82: 0, 83: 0, 86: 0, 195: 2, 196: 0}'';
    ".config/solaar/rules.yaml".text = ''
            %YAML 1.3
      ---
      - MouseGesture: Mouse Up
      - KeyPress:
        - [Super_L, Page_Up]
        - click
      ...
      ---
      - MouseGesture: Mouse Down
      - KeyPress:
        - [Super_L, Page_Down]
        - click
      ...
      ---
      - MouseGesture: []
      - KeyPress:
        - Super_L
        - click
      ...

    '';
  };
}
