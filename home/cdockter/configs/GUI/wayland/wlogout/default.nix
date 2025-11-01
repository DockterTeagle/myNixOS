{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "loginctl lock-session";
        text = "lock";
        keybind = "l";
      }
    ];
  };
}
