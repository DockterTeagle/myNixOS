{
  pkgs,
  config,
  inputs,
  ...
}:
{
  # Imports
  imports = [
    ./secrets
    ./configs
  ];

  # Time and Locale
  time.timeZone = "America/Chicago";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Users
  users.users = {
    cdockter = {
      shell = pkgs.fish;
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets.cdockter_password.path;
      description = "mainUser";
      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
      ];
    };
  };

  # Programs
  programs = {
    nh = {
      package = inputs.nh.packages.${pkgs.stdenv.hostPlatform.system}.default;
      enable = true;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep=3";
      };
      flake = "/home/cdockter/Documents/myNixOS";
    };
    fish.enable = true;
  };

  system = {
    autoUpgrade = {
      enable = true;
      flake = "/home/cdockter/Documents/myNixOS";
    };

    # NixOS Release Version
    stateVersion = "25.05"; # Did you read the comment?
  };
}
