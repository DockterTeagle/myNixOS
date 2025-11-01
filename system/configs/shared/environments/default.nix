{
  imports = [ ./hyprland ];

  programs.regreet = {
    enable = true;
    settings = {
      commands = {
        reboot = [
          "systemctl"
          "reboot"
        ];
        poweroff = [
          "systemctl"
          "poweroff"
        ];
      };
      appearance = {
        greeting_msg = "Welcome back!";
      };
    };
  };
  services = {
    greetd = {
      enable = true;
      restart = true;
    };
  };
}
