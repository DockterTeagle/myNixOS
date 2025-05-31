{
  pkgs,
  cdockterSettings,
  systemSettings,
  config,
  ...
}: {
  # Imports
  imports = [
    ./packages
    ./secrets
    ./configs
  ];

  # Time and Locale
  inherit (systemSettings) time;
  inherit (systemSettings) i18n;

  # Services
  services = {
    dbus = {
      implementation = "broker";
      apparmor = "enabled";
    };
    fwupd.enable = true;
    gvfs.enable = true; # needed?
    libinput.enable = true;
    tumbler.enable = true;
    pcscd.enable = true;
    # XServer and GNOME
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      excludePackages = [pkgs.xterm];
      videoDrivers = [
        "nvidia"
      ];
    };
  };

  # Users
  users.users = {
    cdockter = {
      shell = pkgs.fish;
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets.cdockter_password.path;
      inherit (cdockterSettings) description;
      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
      ];
    };
  };

  # Programs
  programs = {
    gnupg = {
      # agent = {
      #   enable = true;
      #   enableSSHSupport = true;
      # };
    };
    nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep=3";
      };
      flake = "/home/cdockter/Documents/myNixOS";
    };
    fish.enable = true;
    zsh.enable = true;
  };

  wsl.enable = systemSettings.WSL;
  # System Auto Upgrade
  system = {
    autoUpgrade.enable = false;

    # NixOS Release Version
    stateVersion = "25.05"; # Did you read the comment?
  };
}
