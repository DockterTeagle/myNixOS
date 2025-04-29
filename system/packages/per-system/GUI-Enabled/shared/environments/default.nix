{pkgs, ...}: {
  imports = [
    ./hyprland
  ];
  #TODO: follow the docs, as it takes too long to start up

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
    # playerctld.enable = true; #TODO: THIS SHOULDN'T BE HERE
    greetd = {
      enable = true;
      restart = true;
    };
  };
  environment = {
    systemPackages = with pkgs; [
      fuseiso # TODO: THIS SHOULD NOT BE HERE
    ];
  };
}
