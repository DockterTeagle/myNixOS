{ pkgs, ... }:
{
  services.mako = {
    enable = true;
    anchor = "top-right";
    layer = "overlay";
    # backgroundColor = ;
    sort = "-time";
    # backgroundColor = ;
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
