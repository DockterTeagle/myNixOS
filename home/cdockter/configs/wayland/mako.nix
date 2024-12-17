_: {
  services.mako = {
    enable = true;
    anchor = "top-right";
    # borderColor = "#7e83b230";
    layer = "overlay";
    sort = "-time";
    defaultTimeout = 1000;
    extraConfig = ''
      [urgency=low]
      border-color=#b8bb26
      [urgency=normal]
      border-color=#d08770
      [urgency=high]
      border-color=#bf616a
      default-timeout=0
      [category=mpd]
      default-timeout=2000
      group-by=category
    '';
  };
}
